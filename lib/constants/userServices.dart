import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// var gNewsApi =
//     'https://gnews.io/api/v4/top-headlines?category=weather&country=in&page=2&lang=en&apikey=0190510406fef69da355099ddbc50a84';

var newsCathchers = "https://api.newscatcherapi.com/v2/latest_headlines";

class newsFactory {
  final String? title;
  final String? publisher;
  final String? published_date;
  final String? link;
  final String? para;
  final String? summary;
  final String? image;
  final String? category;

  const newsFactory({
    this.publisher,
    this.title,
    this.published_date,
    this.link,
    this.para,
    this.summary,
    this.image,
    this.category,
  });

  factory newsFactory.fromJson(Map<String, dynamic> json) {
    return newsFactory(
        title: json['title'],
        publisher: json['rights'],
        published_date: json['published_date'],
        category: json['topic'],
        link: json['link'],
        para: json['excerpt'],
        summary: json['summary'].replaceAll("\n", " "),
        image: json['media']);
  }
}

class UserServices {
  final String? countries;
  final String? topic;
  final String? lang;
  final String? page_size;
  const UserServices(
      {required this.countries,
      this.topic,
      required this.lang,
      required this.page_size});
  Future<List<newsFactory>> getNews() async {
    // final body = jsonEncode({
    //   'countries': 'IN',
    //   'ranked_only': true,
    //   'lang': 'en',
    //   'when': '1h',
    //   'page_size': 10,
    //   'page': 1
    // });
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterConfig.loadEnvVariables();
    final response = await http.get(
      Uri.parse(
          '${newsCathchers}?countries=${countries}&ranked_only=true&lang=${lang}${topic != null ? "&topic=$topic" : ""}&when=24h&page_size=${page_size}&page=1'),
      headers: {
        'x-api-key': "${FlutterConfig.get('API_KEY')}",
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<newsFactory> list = [];

      for (var i = 0; i < data['articles'].length; i++) {
        final entry = data['articles'][i];
        list.add(newsFactory.fromJson(entry));
      }
      return list;
    } else {
      throw Exception("HTTP Error");
    }
  }
}
