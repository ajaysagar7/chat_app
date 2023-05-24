// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatMessage {
  final String content;
  bool isStarred;
  // Other message properties...

  ChatMessage({
    required this.content,
    this.isStarred = false,
    // Initialize other message properties...
  });
}

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final List<ChatMessage> messages = [ChatMessage(content: "hello")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Column(
            children: [
              GestureDetector(
                onLongPress: () {
                  _showContextMenu(context, message);
                },
                child: ListTile(
                  title: Text(message.content),
                  trailing: message.isStarred ? const Icon(Icons.star) : null,
                  // Other message display properties...
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, ChatMessage message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.reply),
                title: const Text('Reply'),
                onTap: () {
                  Navigator.pop(context);
                  _openReplyScreen(context, message);
                },
              ),
              ListTile(
                leading: const Icon(Icons.forward),
                title: const Text('Forward'),
                onTap: () {
                  Navigator.pop(context);
                  _openForwardScreen(context, message);
                },
              ),
              ListTile(
                leading: const Icon(Icons.save),
                title: const Text('Save'),
                onTap: () {
                  Navigator.pop(context);
                  _saveMessage(message);
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_emotions),
                title: const Text('React'),
                onTap: () {
                  Navigator.pop(context);
                  _openEmojiPicker(context, message);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openReplyScreen(BuildContext context, ChatMessage message) {
    // TODO: Implement opening reply screen
  }

  void _openForwardScreen(BuildContext context, ChatMessage message) {
    // TODO: Implement opening forward screen
  }

  void _saveMessage(ChatMessage message) {
    // TODO: Implement saving the message
  }

  void _openEmojiPicker(BuildContext context, ChatMessage message) {
    // TODO: Implement opening emoji picker and handling emoji reactions
  }
}
