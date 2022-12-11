import 'package:firebase_core/firebase_core.dart';
import 'package:prasadam/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prasadam/blocs/application_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
      title: 'Prasadam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    ),
      );
  }
}