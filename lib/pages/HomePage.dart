import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quickbuy/pages/CartPage.dart';
import 'package:quickbuy/pages/CategoryPage.dart';
import 'package:quickbuy/pages/LandingPage.dart';
import 'package:quickbuy/pages/ProfilePage.dart';
import 'package:quickbuy/pages/SavedPage.dart';

import '../styles/TextStyles.dart';
import '../styles/ThemeColors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  FutureBuilder<PackageInfo> _buildVersionCodes(BuildContext context) {
    return FutureBuilder<PackageInfo>(future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Text("Version: ${snapshot.data!.version.toString()}", style: versionStyle(), textAlign: TextAlign.center,);
            default:
              return const SizedBox();
          }
        });
  }


  static const List<Widget> _bottomMenu = <Widget>[
    LandingPage(title: "Home",),
    CategoryPage(title: "Category",),
    CartPage(title: "Cart",),
    ProfilePage(title: "Profile",),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_bottomMenu.elementAt(_selectedIndex).toString()),
        backgroundColor: Colors.black,
        actions: [
          Row(children: [Icon(Icons.person_pin, color: Colors.white,), SizedBox(width: 8,)],)
        ],
      ),
      body: Center(
        child: _bottomMenu.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
          child: Expanded(
            child: Column(children: [
              Expanded(child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: ThemeColors.mainColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // Container(padding: const EdgeInsets.all(8), color: Colors.white ,child: Image.asset(
                        //     'assets/images/dashboard.png',
                        //     width: 40,
                        //     height: 40,
                        //     fit: BoxFit.fitWidth),),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text('Quick Buy', style: drawerHeaderTextStyle(),)
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_filled),
                    iconColor: Colors.black,
                    title: const Text('Home'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.local_offer_outlined),
                    iconColor: Colors.black,
                    title: const Text('Offers'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.category),
                    iconColor: Colors.black,
                    title: const Text('Categories'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.airplane_ticket_sharp),
                    iconColor: Colors.black,
                    title: const Text('My Coupons'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    iconColor: Colors.black,
                    title: const Text('Settings'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    iconColor: Colors.black,
                    title: const Text('Log-Out'),
                    onTap: () {},
                  ),
                ],
              )),
              // Row(children: [Expanded(child: _buildVersionCodes(context),)],)
            ],),
          )
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category, color: Colors.white),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded, color: Colors.white),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              onTap: _onItemTapped,
            ),

          )
      ),
    );
  }
}