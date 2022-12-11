import 'package:firebase_auth/firebase_auth.dart';
import 'package:prasadam/screens/home.dart';
import 'package:prasadam/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:prasadam/screens/user.dart';
//import 'package:prasadam/navigation.dart';

import 'package:prasadam/screens/favourites.dart';
import 'package:prasadam/screens/subscriptions.dart';
import 'package:prasadam/screens/daily_updates.dart';
import 'package:prasadam/screens/notifications.dart';
import 'package:prasadam/screens/contact_us.dart';

import 'package:geolocator/geolocator.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  // Position _currentPosition;
  // String _currentAddress;

  int currentTab = 0;
    final List<Widget> screens = [
      HomePage(),
      FavouritesPage(),
      SubscriptionsPage(),
      UserPage()
    ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        // title: const Text(
        //   'Homescreen',
        //   style: TextStyle(
        //     color: Colors.black
        //   )
        // ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 2,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     showSearch(
          //       context: context,
          //       delegate:MySearchDelegate(),
          //     );
          //   },
          //   // color: Colors.black,
          // ),
          IconButton(
            icon: const Icon(Icons.notification_add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
          builder:(context) => const NotificationsPage(),
        ));
            },
            // color: Colors.black,
          ),
        ],
      //   flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/indian_food_d2.jpg'),
      //       fit: BoxFit.cover,
      //       )
      //   ),
      // ),
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState((){
                          currentScreen = HomePage();
                          currentTab = 0;

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0? Colors.black : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(color: currentTab == 0? Colors.black : Colors.grey)
                            )
                        ] 
                      ,)
                      ),
                      MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState((){
                          currentScreen = FavouritesPage();
                          currentTab = 1;

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: currentTab == 1? Colors.black : Colors.grey,
                            ),
                            Text(
                              'Favourites',
                              style: TextStyle(color: currentTab == 1? Colors.black : Colors.grey)
                            )
                        ] 
                      ,)
                      ),
                      MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState((){
                          currentScreen = SubscriptionsPage();
                          currentTab = 2;

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.subscriptions,
                            color: currentTab == 2? Colors.black : Colors.grey,
                            ),
                            Text(
                              'Subscription',
                              style: TextStyle(color: currentTab == 2? Colors.black : Colors.grey)
                            )
                        ] 
                      ,)
                      ),
                      MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState((){
                          currentScreen = UserPage();
                          currentTab = 3;

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 3? Colors.black : Colors.grey,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(color: currentTab == 3? Colors.black : Colors.grey)
                            )
                        ] 
                      ,)
                      )
                  ],
                  )
              ],
              )
          )
        ),
    );
  }
}

// class MySearchDelegate extends SearchDelegate{
//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//     onPressed: () => close(context, null),
//      icon: const Icon(Icons.arrow_back)
//      );

//   @override 
//   List<Widget>? buildActions(BuildContext context) => [
//     IconButton(
//       onPressed: () {
//         if (query.isEmpty){
//           close(context,null);
//         }else{
//           query = '';
//         }
        
//       },
//       icon: const Icon(Icons.clear),
//       )
//   ];

//   @override 
//   Widget buildResults(BuildContext context) => Container();

//   @override 
//   Widget buildSuggestions(BuildContext context) => Container();

// }

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
    color: Color.fromARGB(191, 237, 145, 7),
    // elevation: 2,
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
          // backgroundImage: AssetImage(
          //   'assets/images/logo4.png'
          // ),
        ),
        SizedBox(height: 12),
        Text(
          'prasadam@gmail.com',
          style:TextStyle(fontSize: 16, color: Colors.black)
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
    //   ListTile(
    //   leading: const Icon(Icons.home_outlined),
    //   title: const Text('Home'),
    //   onTap: () => {
    //     Navigator.pop(context),
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => const HomeScreen(),
    //   )),
    //   }
    // ),
    // ListTile(
    //   leading: const Icon(Icons.favorite_border),
    //   title: const Text('Favourites'),
    //   onTap: () {
    //     Navigator.pop(context);
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder:(context) => const FavouritesPage(),
    //     ));
    //   },
    // ),
    // ListTile(
    //   leading: const Icon(Icons.subscriptions_outlined),
    //   title: const Text('Subscription'),
    //   onTap: () {
    //     Navigator.pop(context);
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder:(context) => const SubscriptionsPage(),
    //     ));
    //   },
    // ),
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
    // const Divider(color: Colors.black54),
    // ListTile(
    //   leading: const Icon(Icons.notification_add),
    //   title: const Text('Notifications'),
    //   onTap: () {
    //     Navigator.pop(context);
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder:(context) => const NotificationsPage(),
    //     ));
    //   },
    // ),
    
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
