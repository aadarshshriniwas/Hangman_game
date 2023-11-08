import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hangman_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          // Replace 'YourOtherPage()' with the actual widget for your other page.
          return HomeScreen();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hangman: The Game",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            SpinKitWaveSpinner(
              color: Colors.white,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
