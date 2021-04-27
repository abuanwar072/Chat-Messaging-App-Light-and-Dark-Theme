import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/call_history_card.dart';

class CallsHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calls"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
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
    );
  }
}
