import 'package:flutter/material.dart';
import 'package:language_partner/service_locator.dart';
import 'package:language_partner/services/chat_service.dart';

class ChatScreenManager {
  final messageListNotifier = MessageNotifier();
  final chatService = getIt<ChatService>();

  void send(String userMessage) async {
    final message = Message(userMessage, Sender.user);
    messageListNotifier.add(message);
    final botResponse = await chatService.send(message.text);
    final response = Message(botResponse, Sender.bot);
    messageListNotifier.add(response);
  }
}

class MessageNotifier extends ValueNotifier<List<Message>> {
  MessageNotifier() : super([]);

  void add(Message message) {
    value.add(message);
    notifyListeners();
  }
}

class Message {
  const Message(this.text, this.sender);
  final String text;
  final Sender sender;
}

enum Sender { user, bot }
