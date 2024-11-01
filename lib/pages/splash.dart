import 'package:flutter/material.dart';
import 'package:spark/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  void _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF212028),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/SparkLogo5.png",
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ignite Your Curiosity, Illuminate Your World!",
                style: TextStyle(fontFamily: "Oswald", fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
