import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

import 'components/call_bg.dart';
import 'components/call_option.dart';

class AudioCallingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: CallBg(
        image: Image.asset(
          "assets/images/call_bg.png",
          fit: BoxFit.cover,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/user_2.png"),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "Ralph Edwards",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: defaultPadding / 2),
              Text(
                "Ringing",
                style: TextStyle(color: Colors.white70),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 2, vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CallOption(
                      icon: Icon(Icons.volume_down),
                      press: () {},
                    ),
                    CallOption(
                      icon: Icon(Icons.mic),
                      press: () {},
                    ),
                    CallOption(
                      icon: Icon(Icons.videocam_off),
                      press: () {},
                    ),
                    CallOption(
                      icon: Icon(Icons.call_end),
                      color: errorColor,
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
