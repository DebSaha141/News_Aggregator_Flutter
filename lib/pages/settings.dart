import 'package:flutter/material.dart';
import 'package:spark/components/navbar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18171c),
      appBar: Navbar(context),
      body: Text("Settings"),
    );
  }
}
