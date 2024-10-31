import 'package:flutter/material.dart';
import 'package:spark/components/footer.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/components/newsMaker.dart';
import 'package:spark/constants/userServices.dart';

class CategoryNews extends StatefulWidget {
  final String? topic;
  const CategoryNews({Key? key, required this.topic}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late Future<List<newsFactory>> futureNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 5, 5),
      // backgroundColor: Color(0xFF18171c),
      appBar: Navbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Center(
                  child: Text(
                "${widget.topic?.capitalize()} News",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
            ),
            NewsMaker(
              countries: "IN,US,UK,RU",
              lang: "en",
              page_size: "50",
              topic: widget.topic,
            ),
            SizedBox(
              height: 20,
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
