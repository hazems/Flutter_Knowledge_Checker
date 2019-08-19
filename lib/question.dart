import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO add question text ...
      child: Text(this.questionText, style: TextStyle(fontSize: 20),),
    );
  }
}