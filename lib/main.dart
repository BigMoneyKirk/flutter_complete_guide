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

  void _nextQuestion(List<String> questions) {
    setState(
        () => {if (_questionIndex != questions.length - 1) _questionIndex++});
  }

  void _previousQuestion() {
    setState(() => {if (_questionIndex != 0) _questionIndex--});
  }

  void _answerQuestion() {
    print("Testing: 1, 2, 3");
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      "What's your favorite color?",
      "What's your favorite animal?",
      "What's up with you?"
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Complete Guide"),
              backgroundColor: Colors.indigo,
            ),
            body: Column(children: <Widget>[
              Question(questions[_questionIndex]),
              RaisedButton(
                child: Answer("Huh?", () => _nextQuestion(questions)),
              ),
              RaisedButton(
                child: Text("Answer 2"),
                onPressed: () => _nextQuestion(questions),
              ),
              RaisedButton(
                child: Text("Answer 3"),
                onPressed: _previousQuestion,
              )
            ])));
  }
}
