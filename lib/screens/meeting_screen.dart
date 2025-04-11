import 'package:Meetique/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(onPressed: JitsiMeetMethods().crea,
            text: 'New Meeting',
            icon: Icons.videocam,),
            HomeMeetingButton(onPressed: () {},
            text: 'Join Meeting',
            icon: Icons.add_box_rounded,),
            HomeMeetingButton(onPressed: () {},
            text: 'Schedule',
            icon: Icons.calendar_view_day_rounded,),
            HomeMeetingButton(onPressed: () {},
            text: 'Share Screen',
            icon: Icons.arrow_upward_rounded,),
          ],
        ),
        const Expanded(child: Center(child: Text('Create/Join Meeting with just a Click',style: TextStyle(fontWeight: FontWeight.bold),),))
      ],
    );
  }
}