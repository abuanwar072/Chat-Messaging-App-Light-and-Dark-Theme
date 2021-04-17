import 'package:flutter/material.dart';

import 'package:chat/screens/search/components/body.dart';

import '../../constants.dart';
import 'components/call_history_card.dart';

class CallsSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calls"),
      ),
      body: Column(
        children: [
          // Appbar search
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding),
            padding: EdgeInsets.fromLTRB(
              kDefaultPadding,
              0,
              kDefaultPadding,
              kDefaultPadding,
            ),
            color: kPrimaryColor,
            child: Form(
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  // search
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: kContentColorLightTheme.withOpacity(0.64),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kContentColorLightTheme.withOpacity(0.64),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: ListView(
                children: [
                  // For demo
                  ...List.generate(
                    demoContactsImage.length,
                    (index) => CallHistoryCard(
                      name: "Darlene Robert",
                      image: demoContactsImage[index],
                      time: "3m ago",
                      isActive: index.isEven,
                      isOutgoingCall: index.isOdd,
                      isVideoCall: index.isEven,
                      press: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
