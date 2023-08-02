import 'package:flutter/material.dart';

class Reservas extends StatefulWidget {
  const Reservas({super.key});
  @override
  State<Reservas> createState() => ReservasState();
}

class ReservasState extends State<Reservas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reservas",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: const Center(
        child: Text('Reservas'),
      ),
    );
  }
}
