import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  bool? breakfast = false;
  bool? lunch = false;
  bool? dinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
            value: breakfast,  
            onChanged: (val){
              setState(() {
                breakfast = val;
              });
            },
            activeColor: Colors.green,
            title: Text("Breakfast"),
            // subtitle: Text ("")
            ),

            CheckboxListTile(
            value: lunch, 
            onChanged: (val){
              setState(() {
                lunch = val;
              });
            },
            activeColor: Colors.green,
            title: Text("Lunch"),
            // subtitle: Text ("")
            ),

            CheckboxListTile(
            value: dinner, 
            onChanged: (val){
              setState(() {
                dinner = val;
              });
            },
            activeColor: Colors.green,
            title: Text("Dinner"),
            // subtitle: Text ("")
            ),

        ],
      )
    );
  }
}
