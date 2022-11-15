import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.lightBlue,
      )
    );
  }
}