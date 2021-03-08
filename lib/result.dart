import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _finalScore;
  final Function _resetHandler;

  String get resultPhrase {
    String resultText;
    if (_finalScore > 5) {
      resultText = 'You are awsome';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  Result(this._finalScore,this._resetHandler);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: _resetHandler,
            child: Text('Restart quiz'),
          )
        ],
      ),
    );
  }
}
