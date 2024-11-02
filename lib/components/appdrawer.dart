import 'package:flutter/material.dart';
import 'package:spark/pages/settings.dart';

Drawer AppDrawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(children: [
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Drawer1.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 40),
            child: Text(
              "Hi!",
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: "Osward",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
        )
      ],
    ),
  );
}
