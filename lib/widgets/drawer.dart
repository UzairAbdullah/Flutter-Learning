// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("resources/images/110599.JPG"),
              ), //Image.asset("resources/images/110599.JPG"),
              accountName: Text("Uzair Abdullah Mir"),
              accountEmail: Text("uzairmir2703@gmail.com"),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black87,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.15,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black87,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.15,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.square_arrow_left,
              color: Colors.black87,
            ),
            title: Text(
              "Logout",
              textScaleFactor: 1.15,
            ),
          ),
        ],
      ),
    );
  }
}
