import 'dart:math';
import 'package:flutter/material.dart';
import 'nidurstodur.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var yellowDiceRoll = 1;
  var redDiceRoll = 1;
  var bluedice = 1;
  var greendice = 1;

  void rollDice() {
    setState(() {
      yellowDiceRoll = randomizer.nextInt(6) + 1;
      redDiceRoll = randomizer.nextInt(6) + 1;
      bluedice = randomizer.nextInt(6) + 1;
      greendice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/yellowDiceRoll-$yellowDiceRoll.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            yellowDiceRoll = (yellowDiceRoll + 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            yellowDiceRoll = (yellowDiceRoll - 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 2,
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/redDiceRoll-$redDiceRoll.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            redDiceRoll =
                                (redDiceRoll + 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            redDiceRoll =
                                (redDiceRoll - 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/greendice-$greendice.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            greendice = (greendice + 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            greendice = (greendice - 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 2,
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/bluedice-$bluedice.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            bluedice =
                                (bluedice + 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            bluedice =
                                (bluedice - 1).clamp(1, 6);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white60,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 1),
          Text(
            '${yellowDiceRoll + redDiceRoll} (${DiceLogic.nidurstodur(yellowDiceRoll, redDiceRoll)})',
            style: const TextStyle(fontSize: 20, color: Colors.white60),
          ),
          const SizedBox(height: 10),
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
