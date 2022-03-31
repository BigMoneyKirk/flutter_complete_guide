import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this._totalScore, this._restartQuiz) {}

  final int _totalScore;
  final VoidCallback _restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: this._restartQuiz,
            child: Text("Restart Quiz"),
            textColor: Colors.indigo,
          )
        ],
      ),
    );
  }

  String get resultPhrase {
    var resultText = "You have received a score $_totalScore / 9! ";
    if (this._totalScore >= 7) {
      resultText += "You are awesome and innocent!";
    } else if (this._totalScore < 7 && this._totalScore > 4) {
      resultText += "Almost there!";
    } else {
      resultText += "Keep working at it, bud.";
    }
    return resultText;
  }
}
