import 'package:flutter/material.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/constants/userServices.dart';
import 'package:spark/models/categorymodel.dart';
import 'package:spark/constants/data.dart';

void main() {
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
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                      height: 500,
                      margin: EdgeInsets.only(
                          top: 10, bottom: 5, left: 15, right: 15),
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
                              child: Image(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1630568001199-984008a7d6b0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
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
                                  "Category : News",
                                  style: TextStyle(
                                      fontFamily: "Oswald",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Delhi hosts world ranking event of Pickleball, the fastest-growing sport",
                                    style: TextStyle(
                                        fontFamily: "freeman",
                                        fontSize: 24,
                                        height: 1.2)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "A major international event of pickleball, one of the fastest-growing games in the world, started in New Delhi on Thursday.The Pickleball World Rankings (PWR), dubbed the PWR DUPR India Masters, features over 700 players from various countries and will be held at the RK Khanna Tennis Stadium between October 24 and 27.International players, including Dustin Boyer and Phuc Huynh from the United States, Mitch Hargreaves and Emilia Schmidt from Australia, Roos Van Reek (Netherlands) and Pei Chuan Kao (Chinese Taipei) are participating.Leading Indian pickleball players Armaan Bhatia and Aditya Ruhela will also compete in the event, which offers a prize pool of USD 50,000.A paddle bat and playing ball. File photo: AFP\n\"The PWR DUPR India Masters is a landmark event that highlights the emergence of pickleball as a beloved sport in India for all ages,\" said Pranav Kohli, CEO of PWR. \"This event not only gives professionals a platform to compete and earn ranking points but also plays a key role in identifying and nurturing domestic talent, fostering a new generation of players and fans,\" he said.\nThe PWR is a unified global ranking system that enables players to earn points by participating in the PWR World Tour to improve their rankings and become eligible for the PWR World Series.\nPeople play pickleball on the courts of CityPickle at Central Park's Wollman Rink on August 27, 2024 in New York City. File photo: AFP/ Spencer Platt\nWhat is pickleball?\nPickleball is similar to tennis, badminton, and table tennis. It is played on a court smaller than that used for tennis. It is played in both doubles and singles formats, and the players use short-handled paddles and a perforated hollow plastic ball.\nThe scoring system is somewhat similar to table tennis, where each player or team that gets to 11 points with a two-point difference wins a set. The serves are made underhand.\nPickleball can be compared to Padel as both games are played worldwide, both at the amateur and professional levels. Read Onmanorama report on the emergence of padel in Kerala.",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  softWrap: true,
                                  style: TextStyle(fontFamily: "Rubik"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Color(0xFF45454c),
                                  ),
                                ),
                                Text(
                                  "Published On : 2024-10-24 20:19:16",
                                  style: TextStyle(
                                      fontFamily: "Oswald",
                                      color: Colors.grey,
                                      fontSize: 13),
                                ),
                                Text(
                                  "From : sumanasa.com",
                                  style: TextStyle(
                                    fontFamily: "Oswald",
                                    color: Colors.grey,
                                    fontSize: 13,
                                    // fontStyle: FontStyle.italic
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ));
                })
            // Center(
            //   child: FutureBuilder<List<newsFactory>>(
            //       future: futureNews,
            //       builder: ((context, snapshot) {
            //         if (snapshot.hasData) {
            //           return const Text('I have Data');
            //         } else if (snapshot.hasError) {
            //           return Text('Error:${snapshot.error}');
            //         }
            //         return Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             CircularProgressIndicator(),
            //           ],
            //         );
            //       })),
            // )
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
