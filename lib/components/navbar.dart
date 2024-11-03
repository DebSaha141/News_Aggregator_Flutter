import 'package:flutter/material.dart';
import 'package:spark/pages/categoryNews.dart';

AppBar Navbar(context) {
  return AppBar(
    title: Image.asset(
      'assets/images/SparkLogo5.png',
      width: 120,
      height: 100,
    ),
    // Spacer(),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 10),
        child: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            )),
      )
    ],
    centerTitle: true,
    toolbarHeight: 65,
    toolbarOpacity: 0.8,
    // elevation: 5,
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //       bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    // ),
    // backgroundColor: Color(0xFF282828),
    backgroundColor: Color(0xFF212028),
  );
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchKeywords = [
    'Intel',
    'Apple',
    'Google',
    'Amazon',
    'Netflix',
    'AMD',
    'Nvidia',
    'Samsung',
    'Huawei',
    'Sony',
    'Facebook',
    'Bitcoin',
    'Elon Musk',
    'Climate Change',
    'Vaccine',
    'Cryptocurrency',
    'Stock Market',
    'Tesla',
    'SpaceX',
    'Artificial Intelligence',
    'Machine Learning',
    'Microsoft',
    'Data Science',
    'Cybersecurity',
    '5G',
    'Electric Vehicles',
    'Renewable Energy',
    'Quantum Computing',
    'Blockchain',
    'Metaverse',
    'NFT',
    'Augmented Reality',
    'Virtual Reality',
    'Big Data',
    'Cloud Computing',
    'Internet of Things',
    'Smart Home',
    'Wearable Technology',
    'Genomics',
    'Biotechnology',
    'Telemedicine',
    'E-commerce',
    'Digital Marketing',
    'Social Media',
    'Streaming Services',
    'Online Education',
    'Remote Work',
    'Gig Economy',
    'Fintech',
    'Sex',
    'Health',
    'Insurtech',
    'Proptech',
    'Edtech',
    'Russia',
    'China',
    'India',
    'North Korea',
    'Healthtech',
    'Agtech',
    'Foodtech',
    'Robotics',
    'Drones',
    'Autonomous Vehicles',
    'Smart Cities',
    'Green Technology',
    'Sustainable Development',
    'Clean Energy',
    'Carbon Footprint',
    'Climate Action',
    'Environmental Conservation',
    'Wildlife Protection',
    'Ocean Cleanup',
    'Plastic Pollution',
    'Deforestation',
    'Renewable Resources',
    'Energy Efficiency',
    'Circular Economy',
    'Zero Waste',
    'Green Building',
    'Sustainable Agriculture',
    'Organic Farming',
    'Urban Farming',
    'Vertical Farming',
    'Hydroponics',
    'Aquaponics',
    'Permaculture',
    'Jaisankhar',
    'War',
    'Terror',
    'BJP',
    "TMC",
    "Congress",
    "Modi",
    "Mamata",
    "Rahul",
    "Sonia",
    "Amit Shah",
    "Yogi",
    "Kejriwal",
    "Owaisi",
    "Pawar",
    "Thackeray",
    'Regenerative Agriculture',
    'Biodiversity',
    'Ecosystem Restoration',
    'Wildlife Corridors',
    'Habitat Preservation',
    'Endangered Species',
    'Climate Resilience',
    'Disaster Preparedness',
    'Emergency Response',
    'Humanitarian Aid',
    'Refugee Crisis',
    'Global Health',
    'Pandemic Response',
    'Vaccine Distribution',
    'Public Health',
    'Mental Health',
    'Healthcare Access',
    'Universal Healthcare',
    'Health Equity',
    'Medical Research',
    'Pharmaceuticals',
    'Telehealth',
    'Digital Health',
    'Health Informatics',
    'Precision Medicine',
    'Genetic Testing',
    'Personalized Medicine',
    'Stem Cell Research',
    'Gene Therapy',
    'CRISPR',
    'Bioinformatics',
    'Synthetic Biology',
    'Bioprinting',
    'Tissue Engineering',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  void showResults(BuildContext context) {
    if (query.isNotEmpty) {
      openPage(context, query);
    }
    super.showResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchedKeywords = [];
    for (String keyword in searchKeywords) {
      if (keyword.toLowerCase().contains(query.toLowerCase())) {
        matchedKeywords.add(keyword);
        if (matchedKeywords.length >= 10) {
          break;
        }
      }
    }
    return ListView.builder(
      itemCount: matchedKeywords.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchedKeywords[index]),
          onTap: () => openPage(context, matchedKeywords[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchedKeywords = [];
    for (String keyword in searchKeywords) {
      if (keyword.toLowerCase().contains(query.toLowerCase())) {
        matchedKeywords.add(keyword);
        if (matchedKeywords.length >= 10) {
          break;
        }
      }
    }
    return ListView.builder(
      itemCount: matchedKeywords.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.arrow_outward),
          title: Text(matchedKeywords[index]),
          onTap: () => openPage(context, matchedKeywords[index]),
          shape: Border(
            bottom: BorderSide(color: Color(0xFF45454c), width: 1),
          ),
        );
      },
    );
  }

  openPage(context, query) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryNews(
                  query: query,
                  endpoint: "search",
                )));
  }
}
