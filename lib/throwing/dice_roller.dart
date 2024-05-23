import 'dart:math';
import 'package:flutter/material.dart';
import 'nidurstodur.dart';
import '../Vitni/Vitni.dart';
import '../database/log.dart';
import '../database/log_database.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int? yellowDiceRoll;
  int? redDiceRoll;
  int? bluedice;
  int? greendice;

  void rollDice() {
    setState(() {
      if ((yellowDiceRoll ?? 0) + (redDiceRoll ?? 0) == 2 || (yellowDiceRoll ?? 0) + (redDiceRoll ?? 0) == 12) {
        greendice = randomizer.nextInt(6) + 1;
        bluedice = randomizer.nextInt(6) + 1;
      } else {
        yellowDiceRoll = randomizer.nextInt(6) + 1;
        redDiceRoll = randomizer.nextInt(6) + 1;
      }
    });
  }

  void saveLog() async {
    final log = Log(
      yellowThrow: yellowDiceRoll ?? 0,
      redThrow: redDiceRoll ?? 0,
      greenThrow: greendice ?? 0,
      blueThrow: bluedice ?? 0,
      kastari: 'kastari', // Example value, replace with actual value
      vitni: 'vitni', // Example value, replace with actual value
      nidurstada: 'nidurstada', // Example value, replace with actual value
      createdTime: DateTime.now(),
    );

    await LogDatabase.instance.create(log);
  }

  @override
  Widget build(BuildContext context) {
    final yellowRedSum = (yellowDiceRoll ?? 0) + (redDiceRoll ?? 0);
    String blueGreenResult = "";

    if (yellowRedSum == 2 || yellowRedSum == 12) {
      blueGreenResult = DiceLogic.newDiceLogic(bluedice ?? 0, greendice ?? 0);
    }

    bool yellowRedDoubles = yellowDiceRoll != null && redDiceRoll != null && yellowDiceRoll == redDiceRoll;
    bool blueGreenDoubles = bluedice != null && greendice != null && bluedice == greendice;
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
                    yellowDiceRoll != null
                        ? "assets/images/yellowDiceRoll-$yellowDiceRoll.png"
                        : "assets/images/yellowblank.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            yellowDiceRoll = ((yellowDiceRoll ?? 0) + 1).clamp(1, 6);
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
                            yellowDiceRoll = ((yellowDiceRoll ?? 0) - 1).clamp(1, 6);
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
                    redDiceRoll != null
                        ? "assets/images/redDiceRoll-$redDiceRoll.png"
                        : "assets/images/redblank.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            redDiceRoll = ((redDiceRoll ?? 0) + 1).clamp(1, 6);
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
                            redDiceRoll = ((redDiceRoll ?? 0) - 1).clamp(1, 6);
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
                          greendice != null
                              ? "assets/images/greendice-$greendice.png"
                              : "assets/images/greenblank.png",
                          width: 120,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  greendice = ((greendice ?? 0) + 1).clamp(1, 6);
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
                                  greendice = ((greendice ?? 0) - 1).clamp(1, 6);
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
                          bluedice != null
                              ? "assets/images/bluedice-$bluedice.png"
                              : "assets/images/blueblank.png",
                          width: 120,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  bluedice = ((bluedice ?? 0) + 1).clamp(1, 6);
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
                                  bluedice = ((bluedice ?? 0) - 1).clamp(1, 6);
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
                ? '$yellowRedSum (${DiceLogic.nidurstodur(yellowDiceRoll ?? 0, redDiceRoll ?? 0)}) (${blueGreenResult})'
                : '${yellowRedSum != 0 ? yellowRedSum : ''} ${yellowDiceRoll != null && redDiceRoll != null ? DiceLogic.nidurstodur(yellowDiceRoll ?? 0, redDiceRoll ?? 0) : ''}',
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
