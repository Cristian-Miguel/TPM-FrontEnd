import 'package:flutter/material.dart';

class Descubrir extends StatefulWidget {
  const Descubrir({super.key});
  @override
  State<Descubrir> createState() => DescubrirState();
}

var buscar = TextEditingController();

class DescubrirState extends State<Descubrir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(93, 93, 93, 0.1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              controller: buscar,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  // icon: Icon(Icons.clear),
                  icon: Icon(Icons.search),
                  color: Colors.pinkAccent,
                  onPressed: () {},
                ),
                hintText: '¿Qué quieres vivir?...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: const Center(
        child: Text('Descubrir'),
      ),
    );
  }
}
