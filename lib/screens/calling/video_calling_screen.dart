import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

import 'components/call_bg.dart';
import 'components/call_option.dart';

class VideoCallingScreen extends StatelessWidget {
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
              // Preview of my camera
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.all(defaultPadding),
                  height: 120,
                  width: 96,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(defaultPadding)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 24),
                        blurRadius: 40,
                        color: Colors.black38,
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/call_bg.png"),
                    ),
                  ),
                ),
              ),
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
