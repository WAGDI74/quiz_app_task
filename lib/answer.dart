import 'package:flutter/material.dart';
import 'package:quiz_app_task/answer_screen.dart';


class Answer extends StatefulWidget {
  final String answerText;
  final Function x ;

  Answer( this.x,this.answerText) ;

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  int _questionIndex = 0;

  void selectedScreen(BuildContext ctx,int n){
    if(n==_questionIndex) {
      Navigator.of(ctx).pushNamed(
        AnswerScreen.routeName,
      ).then((value) => print(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // ignore: deprecated_member_use
      child:RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(widget.answerText ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        onPressed: (){
          selectedScreen(context,_questionIndex);
        }
      ),
    );
  }
}