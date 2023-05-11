import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

import '../../models/ChatMessage.dart';
import 'components/chat_input_field.dart';
import 'components/message.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Dev Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => Message(
                  message: demeChatMessages[index].text,
                  isSender: index == 1,
                ),
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
