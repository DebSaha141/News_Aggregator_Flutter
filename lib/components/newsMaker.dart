import 'package:flutter/material.dart';
// import 'package:flutter_config/flutter_config.dart';
import 'package:spark/constants/userServices.dart';
// import 'package:spark/models/categorymodel.dart';

class NewsMaker extends StatefulWidget {
  final String? countries;
  final String? topic;
  final String? lang;
  final String? page_size;
  const NewsMaker({
    Key? key,
    required this.countries,
    this.topic,
    required this.lang,
    required this.page_size,
  }) : super(key: key);

  @override
  State<NewsMaker> createState() => _NewsMakerState();
}

class _NewsMakerState extends State<NewsMaker> {
  late Future<List<newsFactory>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = UserServices(
            countries: widget.countries,
            topic: widget.topic,
            lang: widget.lang,
            page_size: widget.page_size)
        .getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<newsFactory>>(
          future: futureNews,
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    newsFactory news = snapshot.data?[index];
                    return Container(
                        // height: 500,
                        margin: EdgeInsets.only(
                            top: 10, bottom: 5, left: 12, right: 12),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF45454c), width: 1),
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
                                    return Text('Failed to load image');
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Category : ${news.category}",
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
                                          fontSize: 24,
                                          height: 1.2)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${news.summary}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                    softWrap: true,
                                    style: TextStyle(fontFamily: "Rubik"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ));
                  });
            } else if (snapshot.hasError) {
              return Text('Something Went Wrong!!');
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            );
          })),
    );
  }
}
