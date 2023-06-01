import 'package:flutter/material.dart';

class ChatScreenManager {
  final messageListNotifier = MessageNotifier();
  void send(String text) {
    messageListNotifier.add(text);
  }
}

class MessageNotifier extends ValueNotifier<List<String>> {
  MessageNotifier() : super([]);

  void add(String listItem) {
    value.add(listItem);
    notifyListeners();
  }
}
