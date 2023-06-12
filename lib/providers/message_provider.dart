import 'package:amplify_api/amplify_api.dart';
import 'package:chat/models/Message.dart';
import 'package:chat/repositories/message_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class MessageProvider with ChangeNotifier {
  final _messageRepository = MessageRepository();

  bool _isLoading = false;
  List<Message> _messages = [];
  String? _errorMessage;

  bool get isLoading => _isLoading;
  List<Message> get messages => _messages;
  String? get errorMessage => _errorMessage;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Either<String, Message?>> sendMessage(Message message) {
    return _messageRepository.sendMessage(message);
  }

  void getMessages() async {
    _setIsLoading(true);
    final messageResponse = await _messageRepository.getLatestMessages();

    messageResponse.fold(
      (error) {
        _errorMessage = error;
        notifyListeners();
      },
      (messages) {
        _messages = messages;
        notifyListeners();
      },
    );
    _setIsLoading(false);
  }

  Stream<GraphQLResponse<Message>> getMessagesStream() {
    return _messageRepository.subscribeToMessages();
  }

  void addMessage(Message message) {
    _messages.insert(0, message);
    notifyListeners();
  }
}
