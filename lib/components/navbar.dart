import 'package:flutter/material.dart';

AppBar Navbar(context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Image.asset(
          'assets/images/SparkLogo5.png',
          width: 120,
          height: 100,
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            ))
      ],
    ),
    centerTitle: true,
    toolbarHeight: 65,
    toolbarOpacity: 0.8,
    elevation: 5,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    ),
    backgroundColor: Color(0xFF242526),
  );
}
