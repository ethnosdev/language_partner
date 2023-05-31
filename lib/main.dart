import 'package:flutter/material.dart';
import 'package:language_partner/chat/chat_screen.dart';

void main() {
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
        colorSchemeSeed: Colors.purple,
      ),
      home: const ChatScreen(),
    );
  }
}
