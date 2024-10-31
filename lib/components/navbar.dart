import 'package:flutter/material.dart';

AppBar Navbar(context) {
  return AppBar(
    title: Image.asset(
      'assets/images/SparkLogo5.png',
      width: 120,
      height: 100,
    ),
    // Spacer(),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 10),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            )),
      )
    ],
    centerTitle: true,
    toolbarHeight: 65,
    toolbarOpacity: 0.8,
    // elevation: 5,
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //       bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    // ),
    // backgroundColor: Color(0xFF282828),
    backgroundColor: Color(0xFF212028),
  );
}
