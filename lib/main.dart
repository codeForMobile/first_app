import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'package:first_app/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav color ?',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'black', 'score': 5},
        {'text': 'blue', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your fav animal ?',
      'answers': [
        {'text': 'Lion', 'score': 5},
        {'text': 'Tiger', 'score': 2},
        {'text': 'Deer', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your fav something ?',
      'answers': [
        {'text': 'some', 'score': 5},
        {'text': 'more', 'score': 4},
        {'text': 'most', 'score': 1},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore =0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz(){
    setState(() {
          _totalScore = 0;
          _questionIndex = 0;
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
