import 'package:flutter/material.dart';
import 'package:knowledge_checker/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final String questionText; 
  final List<String> answerList;
  final String correctAnswer;
  final Function answerClicked;

  Quiz(
      {@required this.questionText,
      @required this.answerList,
      @required this.correctAnswer,
      @required this.answerClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Question(questionText),
        ...(answerList.map((answer) {
          return Answer(answer,
              () => answerClicked(correctAnswer, answer));
        }))
      ],
    );
  }
}
