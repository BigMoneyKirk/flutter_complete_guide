import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer(this.answerText, this.selectHandler);

  String answerText;
  final Function selectHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        onPressed: selectHandler,
        color: Colors.indigo,
        textColor: Colors.white,
      ),
    );
  }
}
