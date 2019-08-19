import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final Function restartQuiz;

  Result({this.totalQuestions, this.correctAnswers, this.restartQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // TODO PlaceHolder
        Text('You have answered $correctAnswers out of $totalQuestions', style: TextStyle(fontSize: 20),),
        FlatButton(
          child: Text('Restart Quiz'), 
          onPressed: this.restartQuiz,
          textColor: Colors.blue,
          )
      ],
    ));
  }
}
