import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';

class DailyUpdatesPage extends StatelessWidget {
  const DailyUpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Daily Updates'),
        backgroundColor: Colors.lightBlue,
      )
    );
  }
}