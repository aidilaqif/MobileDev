import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(
    this.selectHandler,
    this.answerText
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
        ),
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
