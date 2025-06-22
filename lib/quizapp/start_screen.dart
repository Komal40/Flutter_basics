import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Image.asset('assets/images/diceimages/quiz-logo.png', width: 300, color: const Color.fromARGB(115, 255, 255, 255),),
        SizedBox(height: 50),
        Text("Learn Flutter in fun way!", style: TextStyle(fontSize: 20, color: Colors.white),),
        SizedBox(height: 40),
        OutlinedButton.icon(
        onPressed: startQuiz,
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
        icon:Icon(Icons.arrow_right_alt),
        label: Text("Start Quiz")),

      ],
    ));
  }
}
