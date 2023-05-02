import 'package:flutter/material.dart';

class LogoDisplay extends StatelessWidget {
  var diceeLogo = 'assets/DiceeLogo/diceeLogo.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(diceeLogo), fit: BoxFit.fitHeight)),
    );
  }
}
