import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/constants/userServices.dart';
import 'package:spark/models/categorymodel.dart';
import 'package:spark/constants/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  // loadNews() async {
  //   try {
  //     final results = await UserServices().getNews();
  //     print(results.length);
  //     results.forEach((element) {
  //       print(element.title);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<newsFactory>> futureNews;
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    futureNews = UserServices().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 5, 5),
      // backgroundColor: Color(0xFF18171c),
      appBar: Navbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                // color: Color(0xFF282828),
                color: Color(0xFF212028),
              ),
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 6),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                      height: 120,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoriesWidget(
                                image: categories[index].image,
                                categoryName: categories[index].categoryName);
                          })),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Center(
                  child: Text(
                "Lastest News",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
            ),
            Center(
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
                                    border: Border.all(
                                        color: Color(0xFF45454c), width: 1),
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
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            style:
                                                TextStyle(fontFamily: "Rubik"),
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
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  final image, categoryName;
  const CategoriesWidget({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  //add colors to colors array
                  colors: [
                    Colors.red,
                    Colors.yellow,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 35,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      onTap: () {
        print("Pressed ${categoryName}");
      },
    );
  }
}
