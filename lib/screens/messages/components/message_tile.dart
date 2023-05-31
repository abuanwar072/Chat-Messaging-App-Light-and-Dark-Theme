import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'text_message.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
    this.isSender = false,
  }) : super(key: key);

  final String message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundColor: kPrimaryColor,
              child: Text(
                "A",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
          ],
          TextMessage(message: message, isSender: isSender),
        ],
      ),
    );
  }
}
