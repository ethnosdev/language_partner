import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:language_partner/services/api_key.dart';

abstract interface class ChatService {
  Future<String> send(String message);
}

class ChatGpt implements ChatService {
  @override
  Future<String> send(String message) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiKey.chatGpt}',
    };
    final data = {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': message}
      ]
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      // Process the response body as needed
      final messageContent = responseBody['choices'][0]['message']['content'];
      print(responseBody.toString());
      return messageContent;
    } else {
      return 'Request failed with status: ${response.statusCode}';
    }
  }
}
