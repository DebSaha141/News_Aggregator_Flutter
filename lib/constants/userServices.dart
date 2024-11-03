import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var newsCathchers = "https://api.newscatcherapi.com/v2/";

class newsFactory {
  final String? title;
  final String? publisher;
  final String? published_date;
  final String? link;
  final String? para;
  final String? summary;
  final String? image;
  final String? category;
  final num? score;

  const newsFactory(
      {this.publisher,
      this.title,
      this.published_date,
      this.link,
      this.para,
      this.summary,
      this.image,
      this.category,
      this.score});

  factory newsFactory.fromJson(Map<String, dynamic> json) {
    return newsFactory(
        title: json['title'],
        publisher: json['rights'],
        published_date: json['published_date'],
        category: json['topic'],
        link: json['link'],
        para: json['excerpt'],
        summary: json['summary'].replaceAll("\n", " "),
        image: json['media'],
        score: json["_score"]);
  }
}

class UserServices {
  final String? countries;
  final String? topic;
  final String? lang;
  final String? page_size;
  final String? time;
  final String? endpoint;
  final String? query;

  const UserServices(
      {required this.countries,
      this.topic,
      required this.lang,
      required this.page_size,
      this.time,
      this.endpoint,
      this.query});

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
          '${newsCathchers}${endpoint != null ? "$endpoint" : "latest_headlines"}?${query != null ? "q=$query&" : ""}countries=${countries}&ranked_only=true&lang=${lang}${topic != null ? "&topic=$topic" : ""}${time != null ? "&when=$time" : ""}&page_size=${page_size}&page=1'),
      headers: {
        'x-api-key': "${FlutterConfig.get('API_KEY')}",
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<newsFactory> list = [];
      for (var i = 0; i < data['articles'].length; i++) {
        final entry = data['articles'][i];
        list.add(newsFactory.fromJson(entry));
      }
      if (list[0].score != null) {
        list.sort((a, b) => (a.score ?? 0).compareTo(b.score ?? 0));
        list = list.reversed.toList();
      }
      return list;
    } else {
      print(jsonDecode(response.body));
      throw Exception("HTTP Error");
    }
  }
}
