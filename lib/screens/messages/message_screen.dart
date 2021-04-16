import 'package:chat/constants.dart';
import 'package:chat/screens/call/audio_call_screen.dart';
import 'package:chat/screens/call/video_call_screen.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kristin Watson",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AudioCallingScreen(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoCallScreen(),
            ),
          ),
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
