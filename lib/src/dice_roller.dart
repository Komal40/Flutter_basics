import 'dart:math';

import 'package:flutter/material.dart';

final randomizer=Random();

class DiceRoller extends StatefulWidget{

  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState(){
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>{
  var activeDiceImage='assets/images/diceimages/dice-1.png';

  var diceRoll=2;

  void rollDice(){
    setState(() {
      diceRoll=randomizer.nextInt(6)+1;
     activeDiceImage='assets/images/diceimages/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                  Image.asset(activeDiceImage, width: 200),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: rollDice,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 28)
                    ),
                    child: Text("Roll Dice"))
          ]
          );
  }
}
