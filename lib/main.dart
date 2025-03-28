import 'package:esame/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text("Project App",
            style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body:const Home(),
      ),
    );
  }
}
