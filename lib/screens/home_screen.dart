import 'package:firebase_auth/firebase_auth.dart';
import 'package:prasadam/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:prasadam/screens/user.dart';
//import 'package:prasadam/navigation.dart';

import 'package:prasadam/screens/favourites.dart';
import 'package:prasadam/screens/subscriptions.dart';
import 'package:prasadam/screens/daily_updates.dart';
import 'package:prasadam/screens/notifications.dart';
import 'package:prasadam/screens/contact_us.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Homescreen'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate:MySearchDelegate(),
              );
            },
          ),
        ],
      )
    );
  }
}

class MySearchDelegate extends SearchDelegate{
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, null),
     icon: const Icon(Icons.arrow_back)
     );

  @override 
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        if (query.isEmpty){
          close(context,null);
        }else{
          query = '';
        }
        
      },
      icon: const Icon(Icons.clear),
      )
  ];

  @override 
  Widget buildResults(BuildContext context) => Container();

  @override 
  Widget buildSuggestions(BuildContext context) => Container();

}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.blue.shade700,
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const UserPage(),
        ));
      },
      child:Container(
    padding: EdgeInsets.only(
      top: 24 + MediaQuery.of(context).padding.top,
      bottom: 24,
    ), 
    child: Column(
      children: const [
        CircleAvatar(
          radius: 52,
          backgroundImage: NetworkImage(
            'assets/images/login.png'
          ),
        ),
        SizedBox(height: 12),
        Text(
          'sarah@abs.com',
          style:TextStyle(fontSize: 16, color: Colors.amber)
        )
      ],) 
  )
    )
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
      ListTile(
      leading: const Icon(Icons.home_outlined),
      title: const Text('Home'),
      onTap: () => {
        Navigator.pop(context),
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      )),
      }
    ),
    ListTile(
      leading: const Icon(Icons.favorite_border),
      title: const Text('Favourites'),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const FavouritesPage(),
        ));
      },
    ),
    ListTile(
      leading: const Icon(Icons.subscriptions_outlined),
      title: const Text('Subscription'),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const SubscriptionsPage(),
        ));
      },
    ),
    ListTile(
      leading: const Icon(Icons.update),
      title: const Text('Daily Updates'),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const DailyUpdatesPage(),
        ));
      },
    ),
    const Divider(color: Colors.black54),
    ListTile(
      leading: const Icon(Icons.notification_add),
      title: const Text('Notifications'),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const NotificationsPage(),
        ));
      },
    ),
    
    ListTile(
      leading: const Icon(Icons.contact_page),
      title: const Text('Contact Us'),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const ContactUsPage(),
        ));
      },
    ),

    ListTile(
      leading: const Icon(Icons.logout_rounded),
      title: const Text('Logout'),
      onTap: () {
        FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            });
      },
    ),
    ],
  )
);
}