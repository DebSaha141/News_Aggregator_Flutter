import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spark/constants/userServices.dart';
import 'package:spark/pages/details.dart';

class Carousel extends StatefulWidget {
  final String? language;

  const Carousel({Key? key, this.language}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late Future<List<newsFactory>> futureNews;

  @override
  void initState() {
    super.initState();
    // Initialize futureNews with a dummy future
    futureNews = Future.value([]);
  }

  Future<void> initializeLanguage() async {
    // Simulate waiting for shared preferences to initialize
    await Future.delayed(Duration(seconds: 2));
    if (widget.language != null && widget.language!.isNotEmpty) {
      futureNews = UserServices(
              countries: "IN,US,UK,RU,CA,MX",
              lang: "${widget.language}",
              page_size: "10",
              time: "1h")
          .getNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: initializeLanguage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              height: 300, child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error initializing language'));
        } else {
          return Container(
            child: FutureBuilder<List<newsFactory>>(
              future: futureNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      height: 500,
                      child: Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error fetching data'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  return CarouselSlider(
                    items: snapshot.data!.map((news) {
                      return InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF202126),
                            border:
                                Border.all(color: Color(0xFF45454c), width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              child: Stack(children: [
                                Container(
                                  child: Image.network(
                                    "${news.image}",
                                    height: double.infinity,
                                    width: double.infinity,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Center(
                                          child: Text('Failed to load image'));
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    child: Text("")),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text("${news.title}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "freeman",
                                                fontSize: 28,
                                                height: 1.2)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Published On : ${news.published_date}",
                                        style: TextStyle(
                                            fontFamily: "Oswald",
                                            color: Colors.grey,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "From : ${news.publisher}",
                                        style: TextStyle(
                                          fontFamily: "Oswald",
                                          color: Colors.grey,
                                          fontSize: 13,
                                          // fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                        onTap: () => openPage(context, news),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 400,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        enlargeFactor: 0.2),
                  );
                }
              },
            ),
          );
        }
      },
    );
  }

  openPage(context, news) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Details(news: news)));
  }
}
