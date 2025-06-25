// import 'package:first_app/expensetracker/widgets/expenses.dart';
import 'package:first_app/mealsApp/screens/tabs.dart';
// import 'package:first_app/quizapp/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  runApp(ProviderScope(
    child: MyApp(),
  ),);
}

//quiz app
// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Quiz();
//   }
// }


//expense tracker app
// var kColorScheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       // theme: ThemeData(useMaterial3: true),
//       theme: ThemeData.dark().copyWith(
//       useMaterial3: true,
//       // scaffoldBackgroundColor: Colors.red,
//       // colorScheme: kColorScheme,
//       appBarTheme: AppBarTheme().copyWith(
//         backgroundColor: kColorScheme.onPrimaryContainer,
//         foregroundColor: kColorScheme.primaryContainer
//       ),
//        ),
//       home: Expenses()
//     );
//   }
// }


final theme= ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 131, 57, 0)
    ),
    textTheme:GoogleFonts.latoTextTheme()
);

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: theme,
      home: TabScreen(),
    );
  }
}
