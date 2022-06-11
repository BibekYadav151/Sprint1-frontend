import 'package:flutter/material.dart';

import '../screen/home.dart';
import '../screen/login.dart';



import 'package:shared_preferences/shared_preferences.dart';
import 'package:Sprint1/ipaddress.dart' as ip;

Widget Mydrawer(context) {
  String baseurl = ip.main();
  String token = '';
  String userId = '';
  String un = '';
  late SharedPreferences prefs;

  getToken() async {
    prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId")!;
    token = prefs.getString("token")!;
    un = prefs.getString("username")!;
  }

  @override
  void initState() {
    // super.initState();
    getToken();
  }

  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
        accountName: Text('Sprint1'),
        accountEmail: Text('Sprint1'),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: Image.asset(
              'imag/profile_image.png',
            ),
          ),
        ),
      ),
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
    
     
     
     
      const Divider(),
      ListTile(
        title: const Text('Logout'),
        leading: const Icon(Icons.exit_to_app),
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()))
        },
      ),
    ],
  ));
}
