import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowledge_checker/quiz.dart';
import 'package:knowledge_checker/result.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  static const _questionList = [
    {
      'questionText': 'What is the largest city in the world?',
      'answers': ['NYC', 'Tokyo', 'Chicago', 'Atlanta', 'Mumbai'],
      'correctAnswerIndex': 0
    },
    {
      'questionText': 'What is the longest River in the world?',
      'answers': ['Amazon River', 'Congo River', 'Niger River', 'Nile'],
      'correctAnswerIndex': 3
    },
    {
      'questionText': 'what is the tallest mountain in the world?',
      'answers': ['Manaslu', 'Cho Oyu', 'Everst', 'K2'],
      'correctAnswerIndex': 2
    }
  ];

  void answerClicked(correctAnswer, userAnswer) {
    setState(() {
      if (userAnswer == correctAnswer) {  
        ++_correctAnswers;
      }

      _currentQuestionIndex = _currentQuestionIndex + 1;
    });
  }

  void restartQuiz() {
    setState(() {
      _correctAnswers = 0;
      _currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    List<String> answerList = [];
    var questionText = '';
    var correctAnswerText = '';

    if (_currentQuestionIndex < _questionList.length) {
      var correctAnswerIndex = _questionList[_currentQuestionIndex]['correctAnswerIndex'];
      questionText = _questionList[_currentQuestionIndex]['questionText'];
      answerList = _questionList[_currentQuestionIndex]['answers'];
      correctAnswerText = answerList[correctAnswerIndex];
    }

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Knowledge Checker!'),
            ),
            body: (_currentQuestionIndex < _questionList.length)
                //TODO PlaceHolder
                ? Quiz(
                    questionText: questionText,
                    answerList: answerList,
                    correctAnswer: correctAnswerText,
                    answerClicked: answerClicked)
                : Result(
                    correctAnswers: _correctAnswers,
                    totalQuestions: _questionList.length,
                    restartQuiz: restartQuiz)));
  }
}
