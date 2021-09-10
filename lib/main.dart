import 'package:flutter/material.dart';
import 'package:quiz_app_task/quiz.dart';
import 'package:quiz_app_task/result.dart';
import 'answer_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isSwitched = false ;
  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 =0 , num1=0 , num2=0 ;


  void answerQuestion(score){

    if(_questionIndex==0) num0 = score ;
    else if(_questionIndex==1) num1 = score ;
    else if(_questionIndex==2) num2 = score ;




    _totalScore += score;
    setState(() {
      _questionIndex+=1 ;
    });

    print("_questionindex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("totalscore=$_totalScore");
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/'  : (context) => MyHomePage(),
        AnswerScreen.routeName: (context) => AnswerScreen(_question,_questionIndex,answerQuestion),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() =>_MyHomePageState();
}
Color w =  Colors.white;
Color b =  Colors.black;
class _MyHomePageState extends State<MyHomePage> {



  bool isSwitched = false ;
  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 =0 , num1=0 , num2=0 ;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0 ;
      num0=0;
      num1=0;
      num2=0;
    });
  }

  void answerQuestion(score){

    if(_questionIndex==0) num0 = score ;
    else if(_questionIndex==1) num1 = score ;
    else if(_questionIndex==2) num2 = score ;




    _totalScore += score;
    setState(() {
      _questionIndex+=1 ;
    });

    print("_questionindex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("totalscore=$_totalScore");
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz app", style: TextStyle(color: w , fontWeight: FontWeight.bold)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back , size: 25, ),
              onPressed: (){
                if(_questionIndex==1)  _totalScore -= num0;
                if(_questionIndex==2)  _totalScore -= num1;
                if(_questionIndex==3)  _totalScore -= num2;




                setState(() {
                  if(_questionIndex > 0 ){
                    _questionIndex--;
                  }
                });

                print("_questionindex=$_questionIndex");
                print("num0=$num0");
                print("num1=$num1");
                print("num2=$num2");
                print("totalscore=$_totalScore");

              },
            ),

          ],
        ),
        body: Container(
          color: w,
          child: _questionIndex<_question.length?
          Quiz(_question,_questionIndex,answerQuestion)
              :Result(_resetQuiz,_totalScore),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "Dark Mode",
          ),
          foregroundColor: w,
          backgroundColor: b,
          onPressed: (){
            setState(() {
              b = b==Colors.black?   Colors.white:Colors.black ;
              w = w == Colors.white? Colors.black:Colors.white;
            });
          },
        ),
      );

  }
}