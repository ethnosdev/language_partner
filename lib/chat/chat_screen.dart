import 'package:flutter/material.dart';
import 'package:language_partner/chat/chat_screen_manager.dart';
import 'package:language_partner/service_locator.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final manager = getIt<ChatScreenManager>();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Partner'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<Message>>(
                valueListenable: manager.messageListNotifier,
                builder: (context, messages, child) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isUser = message.sender == Sender.user;
                      return Padding(
                        padding: (isUser)
                            ? const EdgeInsets.only(left: 40.0)
                            : const EdgeInsets.only(right: 40.0),
                        child: Align(
                          alignment: (isUser)
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Card(
                            color: (isUser)
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectableText(message.text),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      manager.send(_controller.text);
                      _controller.clear();
                      await Future.delayed(const Duration(milliseconds: 100));
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
