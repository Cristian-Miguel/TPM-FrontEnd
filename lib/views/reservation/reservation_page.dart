import 'package:flutter/material.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reservation",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: const Center(
        child: Text('Reservation'),
      ),
    );
  }
}
