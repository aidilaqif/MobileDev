import 'package:flutter/material.dart';

class DiceDisplay extends StatelessWidget {
  final int diceIndexOne;
  final int diceIndexTwo;
  DiceDisplay({required this.diceIndexOne, required this.diceIndexTwo});

  @override
  Widget build(BuildContext context) {
    var diceOne = 'assets/DiceOne/dice1.png';
    var diceTwo = 'assets/DiceTwo/dice2.png';
    var diceThree = 'assets/DiceThree/dice3.png';
    var diceFour = 'assets/DiceFour/dice4.png';
    var diceFive = 'assets/DiceFive/dice5.png';
    var diceSix = 'assets/DiceSix/dice6.png';
    var diceImages = [diceOne, diceTwo, diceThree, diceFour, diceFive, diceSix];
    return Container(
        height: 150,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(diceImages[diceIndexOne]))),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(diceImages[diceIndexTwo]))),
            )
          ],
        ));
  }
}
