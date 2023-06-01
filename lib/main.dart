import 'package:flutter/material.dart';
import 'package:language_partner/chat/chat_screen.dart';
import 'package:language_partner/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const LanguagePartnerApp());
}

class LanguagePartnerApp extends StatelessWidget {
  const LanguagePartnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const ChatScreen(),
    );
  }
}
