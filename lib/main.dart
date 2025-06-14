import 'package:flutter/material.dart';
import 'package:first_app/src/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      backgroundColor: Colors.blue,
      body: GradientColour(const Color.fromARGB(255, 14, 13, 13), Colors.red)
    ));
  }
}
