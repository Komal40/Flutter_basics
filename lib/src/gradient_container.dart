import 'package:first_app/src/dice_roller.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.bottomRight;
// ? tell to define which type is of variable either type or null
Alignment? endAlignment;


class GradientColour extends StatelessWidget{
  const GradientColour(this.startColor, this.endColor, {super.key});

  final Color startColor;
  final Color endColor;



  @override
  Widget build(BuildContext context){
  endAlignment = Alignment.topLeft;
    return Container(
        decoration:BoxDecoration(
          gradient: LinearGradient
          (colors:
          // [Color.fromARGB(255, 89, 223, 180), Color.fromARGB(255, 138, 182, 168)],
          [startColor, endColor],
            begin: startAlignment,
            end:endAlignment ?? Alignment.topLeft,
         ),
        ),
        child: Center(
          child: DiceRoller()
        ),
      );
  }
}
