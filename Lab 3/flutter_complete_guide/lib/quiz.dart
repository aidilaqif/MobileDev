import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'package:flutter_complete_guide/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function(int) answerQuestion;
  final int questionIndex;
  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'].toString(),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score'] as int),
              answer['text'].toString());
        }).toList()
      ],
    );
  }
}
