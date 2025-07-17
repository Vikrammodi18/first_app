import 'package:first_application/widget/my_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double days = 30;
    String name = "vikram";
    return Scaffold(
      appBar: AppBar(title: Text("home"), backgroundColor: Colors.red),
      body: Center(child: Text('this flutter\n $name')),
      drawer: MyDrawer(),
    );
  }
}
