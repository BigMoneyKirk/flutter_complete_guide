import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int _questionIndex;
  final Function _nextQuestion;

  Quiz(this.questions, this._questionIndex, this._nextQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Question(questions[_questionIndex]['questionText'] as String),
      ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
        return Answer(answer, _nextQuestion);
      }).toList(),
    ]);
  }
}
