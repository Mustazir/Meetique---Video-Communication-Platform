import 'package:Meetique/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signInWithGoogle(BuildContext context) async {
  bool res = false;
  try {
    // Trigger the Google sign-in flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // User canceled the sign-in flow
      return false;
    }

    // Retrieve the authentication details
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

    if (googleAuth == null || googleAuth.accessToken == null || googleAuth.idToken == null) {
      showSnackBar(context, "Failed to retrieve authentication tokens.");
      return false;
    }

    // Create a new credential using the tokens
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken!,
      idToken: googleAuth.idToken!,
    );

    // Sign in with Firebase
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    User? user = userCredential.user;

    if (user != null) {
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': user.displayName,
          'uid': user.uid,
          'profilePhoto': user.photoURL,
        });
      }
      res = true;
    }
  } on FirebaseAuthException catch (e) {
    showSnackBar(context, e.message ?? "An error occurred during sign-in.");
  } catch (e) {
    showSnackBar(context, "An unexpected error occurred.");
  }
  return res;
}

}
