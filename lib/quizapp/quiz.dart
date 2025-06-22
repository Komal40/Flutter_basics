import 'package:first_app/quizapp/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/quizapp/start_screen.dart';

class Quiz extends StatefulWidget{

  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  var activeScreen='start';

  void changeScreen(){
    setState(() {
      activeScreen='change';
    });
  }

@override
  Widget build(BuildContext context){
    Widget screenWidget = StartScreen(changeScreen);
    if(activeScreen=='change'){
      screenWidget=QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: screenWidget,
      )
    );
  }
}
