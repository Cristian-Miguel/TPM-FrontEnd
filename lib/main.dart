import 'package:flutter/material.dart';
import 'package:turismo_flutter/components/Plantilla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo Demo',
      home: Plantilla(),
    );
  }
}
