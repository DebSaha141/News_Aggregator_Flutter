import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spark/components/footer.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/constants/userServices.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  final newsFactory news;
  const Details({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                // height: 500,
                margin: EdgeInsets.only(top: 10, bottom: 30, left: 5, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF45454c), width: 1),
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF202126)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        height: 200,
                        // color: Colors.amber,
                        width: double.infinity,
                        child: Image.network(
                          "${news.image}",
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Text('Failed to load image');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category : ${news.category?.capitalize()}",
                            style: TextStyle(
                                fontFamily: "Oswald",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("${news.title}",
                              style: TextStyle(
                                  fontFamily: "freeman",
                                  fontSize: 26,
                                  height: 1.2)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${news.summary}",
                            style: TextStyle(fontFamily: "Rubik", fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () => _openURL(news.link),
                              child: Text(
                                "Visit Article Source",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "Oswald"),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFff8210)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFF45454c),
                            ),
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
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Footer()
          ],
        ),
      ),
    );
  }

  Future<void> _openURL(link) async {
    final Uri _url = Uri.parse(link);
    if (!await canLaunchUrl(_url)) {
      Fluttertoast.showToast(
        msg: "Something went wrong!!",
      );
    } else {
      await launchUrl(_url);
    }
  }
}

extension on String? {
  capitalize() {
    return "${this?[0].toUpperCase()}${this?.substring(1)}";
  }
}
