import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Subscriptions'),
        backgroundColor: Colors.lightBlue,
      )
    );
  }
}