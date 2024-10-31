import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
      height: 140,
      color: Color(0xFF212028),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Made With ❤️ In Bhubaneswar",
              style: TextStyle(
                  fontFamily: "Rubik", fontSize: 15, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text("Copyright © 2024 Spark Inc",
                style: TextStyle(
                    fontFamily: "Rubik", fontSize: 14, color: Colors.white)),
            SizedBox(height: 5),
            Text(" Developed By Debmalya Saha",
                style: TextStyle(
                    fontFamily: "Rubik", fontSize: 14, color: Colors.white)),
            SizedBox(height: 5),
            Text("All Rights Reserved",
                style: TextStyle(
                    fontFamily: "Rubik", fontSize: 14, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
