import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class QuizAnswer extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function selectAnswer;

  QuizAnswer(this.question,this.questionIndex,this.selectAnswer);


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Question(question[questionIndex]['questionText']),

        ...(question[questionIndex]['answers'] as List<Map<String, Object>>).map((answer){
          return Answer(() => selectAnswer(answer['answer']),answer['text']);
        }).toList(),
      ],
    );
  }
}