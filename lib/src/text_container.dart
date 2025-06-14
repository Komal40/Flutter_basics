import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget{

  const TextContainer(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context){
    return Text(text,
    style:const TextStyle(
            color: Color.fromARGB(0, 222, 218, 218),
            fontSize: 28,
          ),);
  }
}
