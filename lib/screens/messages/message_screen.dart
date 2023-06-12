import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chat/constants.dart';
import 'package:chat/providers/message_provider.dart';
import 'package:chat/screens/welcome/welcome_screen.dart';
import 'package:chat/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/ChatMessage.dart';
import '../../providers/user_provider.dart';
import 'components/chat_input_field.dart';
import 'components/message_tile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late StreamSubscription _messageSubscribtion;

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  void getMessages() {
    final messageProvider = context.read<MessageProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      messageProvider.getMessages();
      _messageSubscribtion = messageProvider.getMessagesStream().listen(
        (response) {
          if (response.data != null) {
            messageProvider.addMessage(response.data!);
          } else if (response.hasErrors) {
            context.showError(response.errors.first.message);
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _messageSubscribtion.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Dev Chat"),
        actions: [
          IconButton(
            onPressed: () async {
              final response = await context.read<UserProvider>().signOut();
              response.fold(
                (error) => context.showError(error),
                (result) {
                  if (result is CognitoCompleteSignOut) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                      (route) => false,
                    );
                  }
                },
              );
            },
            icon: context.watch<UserProvider>().isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Consumer2<MessageProvider, UserProvider>(
                builder: (_, messProvider, userProvider, __) {
                  if (messProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (messProvider.errorMessage != null) {
                    context.showError(messProvider.errorMessage!);
                    return const Center(child: Text("Error"));
                  }
                  return ListView.builder(
                    reverse: true,
                    itemCount: messProvider.messages.length,
                    itemBuilder: (context, index) => MessageTile(
                      message: messProvider.messages[index],
                      isSender: messProvider.messages[index].userId ==
                          userProvider.currentUser!.userId,
                    ),
                  );
                },
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
