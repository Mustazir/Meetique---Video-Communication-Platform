import 'package:Meetique/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirestoreMethods().meetingsHistory, builder: (context , snapShot){
      if (snapShot.connectionState == ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: (snapShot.data! as dynamic).docs.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'Room Name: ${(snapShot.data! as dynamic).docs[index]['meetingName']}',
          ),
          subtitle: Text(
            'Joined on ${(DateFormat.yMMMd().format((snapShot.data! as dynamic).docs[index]['createdAt'].toDate()))}',
          ),
        ),
      ); 
    },);
  }
}