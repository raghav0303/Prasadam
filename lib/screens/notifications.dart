import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.lightBlue,
      )
    );
  }
}