import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/models/Message.dart';
import 'package:dartz/dartz.dart';

class MessageRepository {
  Future<Either<String, Message?>> sendMessage(Message message) async {
    try {
      final request = ModelMutations.create(message);
      final response = await Amplify.API.mutate(request: request).response;
      return right(response.data);
    } on ApiException catch (e) {
      return left(e.message);
    }
  }

  Future<Either<String, List<Message>>> getMessages() async {
    try {
      // Let's set the message limit to 4
      // It's not featching the latest 4 messages
      // Right now there is no simple way to do that, but I hope soon Amplify fix that
      final request = ModelQueries.list(Message.classType, limit: 20);
      final response = await Amplify.API.query(request: request).response;
      final messages = response.data?.items.whereType<Message>().toList();
      if (messages != null) {
        messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
      return right(messages ?? []);
    } on ApiException catch (e) {
      return left(e.message);
    }
  }

  Future<Either<String, List<Message>>> getLatestMessages() async {
    const graphQLDocument = '''query GetLatestMessages {
            messagesByDate(type: "Message" sortDirection: DESC limit: 4) {
              items {
                id
                message
                username
                type
                userId
                createdAt
              }
            }
          }''';

    try {
      final response = await Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument))
          .response;

      if (response.data != null) {
        Map<String, dynamic> data = json.decode(response.data!);
        List iteams = data['messagesByDate']['items'];
        List<Message> messages =
            iteams.map((message) => Message.fromJson(message)).toList();
        return right(messages);
      }
      return right([]);
    } on ApiException catch (e) {
      return left(e.message);
    }
  }

  Stream<GraphQLResponse<Message>> subscribeToMessages() {
    final subscriptionRequest = ModelSubscriptions.onCreate(Message.classType);
    final operation = Amplify.API.subscribe(
      subscriptionRequest,
      onEstablished: () => safePrint("Subscription established"),
    );

    return operation;
  }
}
