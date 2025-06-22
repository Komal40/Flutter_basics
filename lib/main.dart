import 'package:first_app/expensetracker/widgets/expenses.dart';
// import 'package:first_app/quizapp/quiz.dart';
import 'package:flutter/material.dart';
// import 'package:first_app/src/gradient_container.dart';

// void main() {
//   runApp(const MyApp());
// }

//dice app
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home:Scaffold(
//       backgroundColor: Colors.blue,
//       body: GradientColour(const Color.fromARGB(255, 14, 13, 13), Colors.red)
//     ));
//   }
// }

void main(){
  runApp(MyApp());
}

//quiz app
// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Quiz();
//   }
// }



var kColorScheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      theme: ThemeData.dark().copyWith(
      useMaterial3: true,
      // scaffoldBackgroundColor: Colors.red,
      // colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer
      ),

       ),
      home: Expenses()
    );
  }
}
