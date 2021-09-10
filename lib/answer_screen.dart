import 'package:flutter/material.dart';
import 'package:quiz_app_task/quiz_answer.dart';


class AnswerScreen extends StatefulWidget {
  static const routeName = '/my_answer_screen';


  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function selectAnswer;

  AnswerScreen(this.question,this.questionIndex,this.selectAnswer);

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  int _questionIndex = 0;
  int str0 =0 , str1=0 , str2=0 ;

  void selectAnswer(answer){

    if(_questionIndex==0) str0 = answer ;
    else if(_questionIndex==1) str1 = answer ;
    else if(_questionIndex==2) str2 = answer ;






    print("_questionindex=$_questionIndex");
    print("num0=$str0");
    print("num1=$str1");
    print("num2=$str2");
  }


  final List<Map<String, Object>> _question = [

    {
      'questionText':'what\'s your favourite color?',
      'answers':[
        {'text':'Black  (10 Marks)','score':10},
        {'text':'Green  (20 Marks)','score':20},
        {'text':'Blue   (30 Marks)','score':30},
        {'text':'Yellow  (40 Marks)','score':40},
      ]
    },

    {
      'questionText':'what\'s your favourite animal?',
      'answers':[
        {'text':'Lion  (10 Marks)' , 'score':10},
        {'text':'Dog  (20 Marks)', 'score':20},
        {'text':'Cat  (30 Marks)','score':30},
        {'text':'Tiger  (40 Marks)', 'score':40},
      ]
    },
    {
      'questionText':'what\'s your favourite instructor?',
      'answers':[
        {'text':'Osama  (10 Marks)', 'score':10},
        {'text':'Mohamed  (20 Marks)','score':20},
        {'text':'Mahmoud  (30 Marks)','score':30},
        {'text':'Ahmed  (40 Marks)','score':40},
      ]
    },
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Answer"),),
      body:  Container(
        child: _questionIndex<_question.length?
        QuizAnswer(_question,_questionIndex,selectAnswer)
            :null,
      ),
    );

  }
}
