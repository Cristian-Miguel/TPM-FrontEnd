import 'package:flutter/material.dart';

class Descovery extends StatefulWidget {
  const Descovery({super.key});
  @override
  State<Descovery> createState() => _DescoveryState();
}

var buscar = TextEditingController();

class _DescoveryState extends State<Descovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
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
                  icon: const Icon(Icons.search),
                  color: Colors.pinkAccent,
                  onPressed: () {},
                ),
                hintText: 'What do you want to live?...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: const Center(
        child: Text('Discover'),
      ),
    );
  }
}
