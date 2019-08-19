import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function answerSelectedHandler;

  Answer(this.text, this.answerSelectedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO add answer button ...
      width: double.infinity,
      child: RaisedButton(
        child: Text(this.text),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: this.answerSelectedHandler,
      ),
    );
  }
}
