// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// User? user= FirebaseAuth.instance.currentUser;

// class Navigation extends StatelessWidget {
//   const Navigation({super.key});

//   final FirebaseUser user = await _auth.currentUser();

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           UserAccountsDrawerHeader(accountName:Text("${user.displayName}"), accountEmail: Text("${user.email}")
//         ]
//       )
//     ); 
//   }
// }