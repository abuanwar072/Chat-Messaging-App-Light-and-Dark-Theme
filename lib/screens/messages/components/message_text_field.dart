import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chat/models/Message.dart';
import 'package:chat/providers/message_provider.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  late final TextEditingController _messageController;
  late AuthUser _currentUser;

  @override
  void initState() {
    _messageController = TextEditingController();
    // We know when we are at chat page, we are already loged in
    _currentUser = context.read<UserProvider>().currentUser!;
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _messageController,
        textInputAction: TextInputAction.send,
        // Let's try it now
        // We need to restart it first
        // Message send properly
        // It's time to show it
        onFieldSubmitted: (value) async {
          if (value.isNotEmpty) {
            final message = Message(
              userId: _currentUser.userId,
              username: _currentUser.username,
              message: _messageController.text,
              type: "Message",
              createdAt: DateTime.now().toString(),
            );
            final response =
                await context.read<MessageProvider>().sendMessage(message);
            response.fold(
              (error) => context.showError(error),
              (resMessage) {
                if (resMessage != null) {
                  _messageController.clear();
                }
              },
            );
          }
        },
        decoration: InputDecoration(
          hintText: "Type message",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
