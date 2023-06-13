abstract interface class ChatService {
  Future<String> send(String message);
}

class ChatGpt implements ChatService {
  @override
  Future<String> send(String message) async {
    return 'Howdy';
  }
}
