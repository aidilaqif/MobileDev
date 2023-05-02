import 'dart:math';
import 'package:dicee/widget/diceDisplay.dart';
import 'package:dicee/widget/logoDisplay.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var backgroundImage = 'assets/GreenBackground/newbackground.png';

  var diceIndexOne = 0;
  var diceIndexTwo = 0;
  void _rollDice() {
    setState(() {
      diceIndexOne = Random().nextInt(6);
      diceIndexTwo = Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(image: buildBackground()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          LogoDisplay(),
          DiceDisplay(diceIndexOne: diceIndexOne, diceIndexTwo: diceIndexTwo),
          Container(
            height: 50,
            width: 130,
            decoration: BoxDecoration(color: Color(0XFF9B1C1F)),
            child: TextButton(
                onPressed: _rollDice,
                child: Text(
                  'Button',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  DecorationImage buildBackground() {
    return DecorationImage(
        image: AssetImage(backgroundImage), fit: BoxFit.fill);
  }
}
