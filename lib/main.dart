import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  String displayQuestion = "The question!";
  int _totalScore = 0;

  void _nextQuestion(List<Object> questions, int score) {
    _totalScore += score;
    setState(() => {if (_questionIndex != questions.length) _questionIndex++});
  }

  void _restartQuiz() {
    setState(() {
      this._totalScore = 0;
      this._questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': "What's your favorite color?",
        'answers': [
          {"text": "Green", "score": 3},
          {"text": "Indigo", "score": 2},
          {"text": "Grey", "score": 1}
        ]
      },
      {
        'questionText': "What's your favorite animal?",
        'answers': [
          {"text": "Dog", "score": 1},
          {"text": "Lion", "score": 3},
          {"text": "Bear", "score": 2}
        ]
      },
      {
        'questionText': "What's up with you?",
        'answers': [
          {"text": "Nuthan", "score": 3},
          {"text": "Just Chillin", "score": 2},
          {"text": "Coolin' it", "score": 1}
        ]
      }
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Complete Guide"),
              backgroundColor: Colors.indigo,
            ),
            body: _questionIndex < _questions.length
                ? Quiz(_questions, _questionIndex, _nextQuestion)
                : Result(_totalScore, _restartQuiz)));
  }
}
