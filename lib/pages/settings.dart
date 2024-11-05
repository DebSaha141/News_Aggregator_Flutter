import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/components/navbar.dart';
import 'package:spark/main.dart';

final _formKey = GlobalKey<FormState>();

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Map<String, String> languageCodes = {
    'English': 'en',
    'French': 'fr',
    'Spanish': 'es',
    'German': 'de',
    // 'Russian': 'ru',
    // 'Arabic': 'ar',
    'Hindi': 'hi',
    'Portuguese': 'pt',
    'Italian': 'it',
    // 'Japanese': 'ja',
    // 'Korean': 'ko',
    // 'Dutch': 'nl',
    // 'Swedish': 'sv',
    // 'Turkish': 'tr',
    'Vietnamese': 'vi',
    // 'Greek': 'el',
    // 'Hebrew': 'he',
    // 'Bengali': 'bn',
  };

  String? selectedLanguage = 'English';

  SharedPreferences? _prefs;

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    selectedLanguage = _getPrefs();
    if (selectedLanguage != null) {
      selectedLanguage = languageCodes.entries
          .firstWhere((entry) => entry.value == selectedLanguage)
          .key;
    }
    setState(() {
      selectedLanguage = selectedLanguage;
    });
  }

  String? _getPrefs() {
    selectedLanguage = _prefs?.getString('lang');
    return selectedLanguage;
  }

  void _setPrefs(String key, String value) {
    _prefs?.setString(key, value);
    print("Setting $key to $value");
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18171c),
      appBar: Navbar(context),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 3, left: 20),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        fontFamily: "Oswald",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 24),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      menuMaxHeight: 400,
                      decoration: InputDecoration(
                        labelText: 'Select Language',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      value: selectedLanguage,
                      items: languageCodes.keys.map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(key),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLanguage = newValue!;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          print("I am called");
                          // print(
                          //     'Selected Language: ${languageCodes[selectedLanguage]}');
                          _setPrefs(
                              'lang', languageCodes[selectedLanguage] ?? 'en');
                          Fluttertoast.showToast(
                              msg: "Language set to $selectedLanguage",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          });
                        },
                        child: Text('Submit',
                            style: TextStyle(
                                fontFamily: "Oswald",
                                color: Colors.white,
                                fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
