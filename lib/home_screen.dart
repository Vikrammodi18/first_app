import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double days = 30;
    String name = "vikram";
    return Scaffold(
      appBar: AppBar(title: Text("home"), backgroundColor: Colors.red),
      body: Center(child: Text('this is $days days of flutter\n $name')),
      drawer: Drawer(),
    );
  }
}
