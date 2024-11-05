import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/components/footer.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/components/newsMaker.dart';
import 'package:spark/constants/userServices.dart';

class CategoryNews extends StatefulWidget {
  final String? topic;
  final String? query;
  final String? endpoint;
  final String? time;
  const CategoryNews(
      {Key? key, this.topic, this.query, this.endpoint, this.time})
      : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late Future<List<newsFactory>> futureNews;
  String? lang;

  SharedPreferences? _prefs;

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _getPrefs();
  }

  Future<String> _getPrefs() async {
    lang = await _prefs?.getString('lang');
    return lang!;
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 5, 5, 5),
      backgroundColor: Color(0xFF18171c),
      appBar: Navbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text(
                "${widget.query != null ? "Search Results for ${widget.query?.capitalize()}" : "Category: ${widget.topic?.capitalize()}"}",
                style: TextStyle(
                    fontFamily: "Oswald",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16),
              ),
            ),
            FutureBuilder(
                future: _getPrefs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        height: 300,
                        child: Center(child: CircularProgressIndicator()));
                  } else if (snapshot.data != null ||
                      snapshot.data != "" ||
                      lang != "") {
                    return NewsMaker(
                      countries: "IN,US,UK,RU,CA,MX",
                      lang: lang,
                      page_size: "50",
                      topic: widget.topic,
                      time: widget.time,
                      query: widget.query,
                      endpoint: widget.endpoint,
                    );
                  } else {
                    return Text("Error");
                  }
                }),
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
