import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lokaverk/Vitni.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;
  var currentDiceRoll2 = 1;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      currentDiceRoll2 = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/dice-$currentDiceRoll.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentDiceRoll = (currentDiceRoll + 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white60,
                          size: 40,
                        ),
                      ),
                      Text(
                        '$currentDiceRoll',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white60,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentDiceRoll = (currentDiceRoll - 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white60,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/reddice-$currentDiceRoll2.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentDiceRoll2 = (currentDiceRoll2 + 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white60,
                          size: 40,
                        ),
                      ),
                      Text(
                        '$currentDiceRoll2',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white60,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            currentDiceRoll2 = (currentDiceRoll2 - 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white60,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white60,
                textStyle: const TextStyle(
                  fontSize: 25,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(color: Colors.white60),
                ),
                backgroundColor: Colors.white60),
            child: const Text(
              "Kasta",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
