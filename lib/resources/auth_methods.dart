import 'package:Meetique/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stream for auth state changes
  Stream<User?> get authChanges => _auth.authStateChanges();

  /// Currently logged-in user
  User get user => _auth.currentUser!;

  /// Sign in with Google
  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If user cancels the sign-in
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        // If user is new, save data to Firestore
        if (userCredential.additionalUserInfo?.isNewUser ?? false) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'email': user.email,
            'profilePhoto': user.photoURL,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message ?? 'Something went wrong.');
      return false;
    } catch (e) {
      showSnackBar(context, 'An unexpected error occurred.');
      debugPrint('Google sign-in error: $e');
      return false;
    }
  }

  /// Sign out from Firebase and Google
  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut(); // Google sign out
      await _auth.signOut(); // Firebase sign out
    } catch (e) {
      debugPrint('Sign-out error: $e');
    }
  }
}
