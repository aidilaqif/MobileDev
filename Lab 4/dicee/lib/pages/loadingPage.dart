import 'dart:async';
import 'package:dicee/widget/logoDisplay.dart';
import 'package:flutter/material.dart';
import 'package:dicee/pages/homePage.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate a loading process
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  var backgroundImage = 'assets/GreenBackground/newbackground.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(image: buildBackground()),
      child: Center(child: LogoDisplay()),
    ));
  }

  DecorationImage buildBackground() {
    return DecorationImage(
        image: AssetImage(backgroundImage), fit: BoxFit.fill);
  }
}
