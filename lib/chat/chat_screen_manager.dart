import 'package:flutter/material.dart';
import 'package:language_partner/service_locator.dart';
import 'package:language_partner/services/chat_service.dart';

class ChatScreenManager {
  final messageListNotifier = MessageNotifier();
  final chatService = getIt<ChatService>();

  void send(String text) async {
    messageListNotifier.add(text);
    final response = await chatService.send(text);
    messageListNotifier.add(response);
  }
}

class MessageNotifier extends ValueNotifier<List<String>> {
  MessageNotifier() : super([]);

  void add(String listItem) {
    value.add(listItem);
    notifyListeners();
  }
}
