import 'package:flutter/material.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});
  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Message",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: const Center(
        child: Text('Message'),
      ),
    );
  }
}
