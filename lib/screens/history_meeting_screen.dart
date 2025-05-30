import 'package:flutter/material.dart';

import '../resources/firestore_methods.dart';
class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),

          );
        }  
        return ListView.builder(
          itemCount: (snapshot.dart! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Room Name: ${(snapshot.dart! as dynamic).docs[index]['meetingName']}',
            ),
              subtitle: Text(
                'Joined on ${DateFormat.yMMMd().formate((snapshot.dart! as dynamic).docs[index]['createdAt'].toDate())}',
                ),
              ),
            ),
          ),
      },
    );
  }
}