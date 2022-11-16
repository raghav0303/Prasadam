import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.lightBlue,
      )
    );
  }
}