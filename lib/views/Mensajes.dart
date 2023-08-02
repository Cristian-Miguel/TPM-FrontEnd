import 'package:flutter/material.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});
  @override
  State<Mensajes> createState() => MensajesState();
}

class MensajesState extends State<Mensajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mensajes",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: const Center(
        child: Text('Mensajes'),
      ),
    );
  }
}
