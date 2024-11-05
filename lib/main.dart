import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/components/appdrawer.dart';
import 'package:spark/components/carouselSlider.dart';
import 'package:spark/components/footer.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/components/newsMaker.dart';
import 'package:spark/constants/userServices.dart';
import 'package:spark/models/categorymodel.dart';
import 'package:spark/constants/data.dart';
import 'package:spark/pages/categoryNews.dart';

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
  String? lang = "";

  SharedPreferences? _prefs;

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    lang = await _prefs?.getString('lang');
    if (lang == null) {
      _setPrefs("lang", "en");
      print("Successfully set language to English");
      lang = "en";
    }
  }

  void _setPrefs(String key, String value) {
    _prefs?.setString(key, value);
  }

  Future<String> _getPrefs() async {
    lang = await _prefs?.getString('lang');
    return lang!;
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    _initPrefs();
    // futureNews = UserServices().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 5, 5, 5),
      backgroundColor: Color(0xFF18171c),
      appBar: Navbar(context),
      drawer: AppDrawer(context),
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
                                categoryName: categories[index].categoryName,
                                topic: categories[index].topic);
                          })),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                  child: Text(
                "HIGHLIGHTS",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              )),
            ),
            FutureBuilder(
                future: _getPrefs(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        height: 300,
                        child: Center(child: CircularProgressIndicator()));
                  } else if (snapshot.data != null ||
                      snapshot.data != "" ||
                      lang != "") {
                    if (lang == null) {
                      lang = "en";
                    }
                    return Carousel(language: lang);
                  } else {
                    return Text("Error");
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Center(
                  child: Text(
                "LATEST NEWS",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              )),
            ),
            FutureBuilder(
              future: Future.delayed(Duration(seconds: 5)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return NewsMaker(
                    countries: "IN,US,UK,RU,CA,MX",
                    lang: lang,
                    page_size: "50",
                    time: "24h",
                  );
                }
              },
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

class CategoriesWidget extends StatelessWidget {
  final image, categoryName, topic;
  const CategoriesWidget(
      {super.key, this.image, this.categoryName, this.topic});

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
      onTap: () => openPage(context, topic),
    );
  }

  openPage(context, topic) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryNews(
                  topic: topic,
                  time: "24h",
                )));
  }
}
