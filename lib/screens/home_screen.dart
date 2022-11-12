import 'package:firebase_auth/firebase_auth.dart';
import 'package:prasadam/screens/signin_screen.dart';
import 'package:flutter/material.dart';
//import 'package:prasadam/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const NavigationDrawer(),
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            });
          },
        ),
      ),
    );
  }
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

  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),  
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
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      )),
      }
    ),
    ListTile(
      leading: const Icon(Icons.favorite_border),
      title: const Text('Favourites'),
      onTap: () {},
    ),
    ListTile(
      leading: const Icon(Icons.workspaces_outline),
      title: const Text('Workflow'),
      onTap: () {},
    ),
    ListTile(
      leading: const Icon(Icons.update),
      title: const Text('Favourites'),
      onTap: () {},
    ),
    const Divider(color: Colors.black54),
    ListTile(
      leading: const Icon(Icons.account_tree_outlined),
      title: const Text('Plugins'),
      onTap: () {},
    ),
    
    ListTile(
      leading: const Icon(Icons.notification_add),
      title: const Text('Notifications'),
      onTap: () {},
    ),
    ],
  )
);
}