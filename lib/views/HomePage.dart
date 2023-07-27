import 'package:flutter/material.dart';
import 'package:turismo_flutter/components/BottonBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Michoacan Ofrece",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Home'),
      ),
      // bottomNavigationBar: BottonBar(),
    );
  }
}