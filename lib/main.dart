import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _nextQuestion(List<Object> questions) {
    setState(
        () => {if (_questionIndex != questions.length - 1) _questionIndex++});
  }

  void _previousQuestion() {
    setState(() => {if (_questionIndex != 0) _questionIndex--});
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's your favorite color?",
        'answers': ["Green", "Indigo", "Grey"]
      },
      {
        'questionText': "What's your favorite animal?",
        'answers': ["Dog", "Lion", "Bear"]
      },
      {
        'questionText': "What's up with you?",
        'answers': ["Nuthan", "Just Chillin", "Coolin' it"]
      }
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Complete Guide"),
              backgroundColor: Colors.indigo,
            ),
            body: Column(children: <Widget>[
              Question(questions[_questionIndex]['questionText']),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(answer, () => _nextQuestion(questions));
              }).toList(),
            ])));
  }
}
