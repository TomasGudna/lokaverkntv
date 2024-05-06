import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  var currentDiceRoll2 = 5;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
    setState(() {
      currentDiceRoll2 = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/dice-$currentDiceRoll.png",
              width: 150,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/images/dice-$currentDiceRoll2.png",
              width: 150,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white60,
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
          child: const Text("Roll Dice"),
        ),
      ],
    );
  }
}
