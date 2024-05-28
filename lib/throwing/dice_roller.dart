import 'dart:math';
import 'package:flutter/material.dart';
import 'nidurstodur.dart';
import '../Vitni/Vitni.dart';
import '../database/log.dart';
import '../database/log_database.dart';
import '../classes/classes.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  final Function(DiceRollerObject) updateParentState;
  DiceRoller({required this.updateParentState});
  //DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  DiceRollerObject? diceRollerObject;


  void rollDice() {
    setState(() {
      if ((diceRollerObject?.yellowDiceRoll ?? 0) + (diceRollerObject?.redDiceRoll ?? 0) == 2 ||
          (diceRollerObject?.yellowDiceRoll ?? 0) + (diceRollerObject?.redDiceRoll ?? 0) == 12) {
        diceRollerObject?.greendice = randomizer.nextInt(6) + 1;
        diceRollerObject?.bluedice = randomizer.nextInt(6) + 1;
      } else {
        diceRollerObject?.yellowDiceRoll = randomizer.nextInt(6) + 1;
        diceRollerObject?.redDiceRoll = randomizer.nextInt(6) + 1;
      }
    });

    setState(() {

    });
    widget.updateParentState(diceRollerObject!);
  }




  @override
  Widget build(BuildContext context) {
    final yellowRedSum = (diceRollerObject?.yellowDiceRoll ?? 0) + (diceRollerObject?.redDiceRoll ?? 0);
    String blueGreenResult = "";

    if (yellowRedSum == 2 || yellowRedSum == 12) {
      blueGreenResult = DiceLogic.newDiceLogic(diceRollerObject?.bluedice ?? 0, diceRollerObject?.greendice ?? 0);
    }

    bool yellowRedDoubles = diceRollerObject?.yellowDiceRoll != null && diceRollerObject?.redDiceRoll != null && diceRollerObject?.yellowDiceRoll == diceRollerObject?.redDiceRoll;
    bool blueGreenDoubles = diceRollerObject?.bluedice != null && diceRollerObject?.greendice != null && diceRollerObject?.bluedice == diceRollerObject?.greendice;
    String doublesText = yellowRedDoubles ? (blueGreenDoubles ? "DOUBLE DOUBLES!" : "DOUBLES!") : "";

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
                    diceRollerObject?.yellowDiceRoll != null
                        ? "assets/images/yellowDiceRoll-${diceRollerObject?.yellowDiceRoll}.png"
                        : "assets/images/yellowblank.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            diceRollerObject?.yellowDiceRoll = ((diceRollerObject?.yellowDiceRoll ?? 0) + 1).clamp(1, 6);
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
                            diceRollerObject?.yellowDiceRoll = ((diceRollerObject?.yellowDiceRoll ?? 0) - 1).clamp(1, 6);
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
              const SizedBox(width: 2),
              Column(
                children: [
                  Image.asset(
                    diceRollerObject?.redDiceRoll != null
                        ? "assets/images/redDiceRoll-${diceRollerObject?.redDiceRoll}.png"
                        : "assets/images/redblank.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            diceRollerObject?.redDiceRoll = ((diceRollerObject?.redDiceRoll ?? 0) + 1).clamp(1, 6);
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
                            diceRollerObject?.redDiceRoll = ((diceRollerObject?.redDiceRoll ?? 0) - 1).clamp(1, 6);
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
          if (yellowRedSum == 2 || yellowRedSum == 12)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          diceRollerObject?.greendice != null
                              ? "assets/images/greendice-${diceRollerObject?.greendice}.png"
                              : "assets/images/greenblank.png",
                          width: 120,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  diceRollerObject?.greendice = ((diceRollerObject?.greendice ?? 0) + 1).clamp(1, 6);
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
                                  diceRollerObject?.greendice = ((diceRollerObject?.greendice ?? 0) - 1).clamp(1, 6);
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
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Image.asset(
                          diceRollerObject?.bluedice != null
                              ? "assets/images/bluedice-${diceRollerObject?.bluedice}.png"
                              : "assets/images/blueblank.png",
                          width: 120,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  diceRollerObject?.bluedice = ((diceRollerObject?.bluedice ?? 0) + 1).clamp(1, 6);
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
                                  diceRollerObject?.bluedice = ((diceRollerObject?.bluedice ?? 0) - 1).clamp(1, 6);
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
              ],
            ),
          const SizedBox(height: 1),
          Text(
            yellowRedSum == 2 || yellowRedSum == 12
                ? '$yellowRedSum (${DiceLogic.nidurstodur(diceRollerObject?.yellowDiceRoll ?? 0, diceRollerObject?.redDiceRoll ?? 0)}) (${blueGreenResult})'
                : '${yellowRedSum != 0 ? yellowRedSum : ''} ${diceRollerObject?.yellowDiceRoll != null && diceRollerObject?.redDiceRoll != null ? DiceLogic.nidurstodur(diceRollerObject?.yellowDiceRoll ?? 0, diceRollerObject?.redDiceRoll ?? 0) : ''}',
            style: const TextStyle(fontSize: 20, color: Colors.white60),
          ),
          if (doublesText.isNotEmpty)
            Text(
              doublesText,
              style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
