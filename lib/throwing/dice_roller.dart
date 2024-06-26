import 'dart:math';
import 'package:flutter/material.dart';
import 'nidurstodur.dart';
import '../classes/classes.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  final Function(DiceRollerObject) updateParentState;
  DiceRoller({required this.updateParentState});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  DiceRollerObject diceRollerObject = new DiceRollerObject();
  int yellowRedSum = 0;
  String yellowRedNidurstada = '';
  String greenBlueNidurstada = '';

  void rollDice() {
    if ((diceRollerObject.yellowDiceRoll ?? 0) +
                (diceRollerObject.redDiceRoll ?? 0) ==
            2 ||
        (diceRollerObject.yellowDiceRoll ?? 0) +
                (diceRollerObject.redDiceRoll ?? 0) ==
            12) {
      // green and blue dice roll
      diceRollerObject.greendice = randomizer.nextInt(6) + 1;
      diceRollerObject.bluedice = randomizer.nextInt(6) + 1;
    } else {
      // yellow and red dice roll
      diceRollerObject.yellowDiceRoll = randomizer.nextInt(6) + 1;
      diceRollerObject.redDiceRoll = randomizer.nextInt(6) + 1;
    }
    getSumAndNidurstada();

    widget.updateParentState(diceRollerObject);
  }

  int updateDiceResult(int additive, int? diceValue) {
    return ((diceValue ?? 0) + additive).clamp(1, 6);
  }

  void getSumAndNidurstada() {
    yellowRedSum = (diceRollerObject.yellowDiceRoll ?? 0) +
        (diceRollerObject.redDiceRoll ?? 0);
    yellowRedNidurstada = DiceLogic.nidurstodur(
        diceRollerObject.yellowDiceRoll ?? 0,
        diceRollerObject.redDiceRoll ?? 0);
    greenBlueNidurstada = DiceLogic.newDiceLogic(
        diceRollerObject.greendice ?? 0, diceRollerObject.bluedice ?? 0);
    diceRollerObject.nidurstada = ('$yellowRedNidurstada $greenBlueNidurstada');
  }

  @override
  Widget build(BuildContext context) {
    // TODO mode to dice roll
    bool yellowRedDoubles = diceRollerObject.yellowDiceRoll != null &&
        diceRollerObject.redDiceRoll != null &&
        diceRollerObject.yellowDiceRoll == diceRollerObject.redDiceRoll;
    bool blueGreenDoubles = diceRollerObject.bluedice != null &&
        diceRollerObject.greendice != null &&
        diceRollerObject.bluedice == diceRollerObject.greendice;
    String doublesText = yellowRedDoubles
        ? (blueGreenDoubles ? "DOUBLE DOUBLES!" : "DOUBLES!")
        : "";

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
                    diceRollerObject.yellowDiceRoll != null
                        ? "assets/images/yellowDiceRoll-${diceRollerObject.yellowDiceRoll}.png"
                        : "assets/images/yellowblank.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            diceRollerObject.yellowDiceRoll = updateDiceResult(
                                1, diceRollerObject.yellowDiceRoll);
                          });
                          getSumAndNidurstada();
                          widget.updateParentState(diceRollerObject);
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
                            diceRollerObject.yellowDiceRoll = updateDiceResult(
                                -1, diceRollerObject.yellowDiceRoll);
                          });
                          getSumAndNidurstada();
                          widget.updateParentState(diceRollerObject);
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
                    diceRollerObject.redDiceRoll != null
                        ? "assets/images/redDiceRoll-${diceRollerObject.redDiceRoll}.png"
                        : "assets/images/redblank.png",
                    width: 120,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            diceRollerObject.redDiceRoll = updateDiceResult(
                                1, diceRollerObject.redDiceRoll);
                          });
                          getSumAndNidurstada();
                          widget.updateParentState(diceRollerObject);
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
                            diceRollerObject.redDiceRoll = updateDiceResult(
                                -1, diceRollerObject.redDiceRoll);
                          });
                          getSumAndNidurstada();
                          widget.updateParentState(diceRollerObject);
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
                          diceRollerObject.greendice != null
                              ? "assets/images/greendice-${diceRollerObject.greendice}.png"
                              : "assets/images/greenblank.png",
                          width: 120,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  diceRollerObject.greendice = updateDiceResult(
                                      1, diceRollerObject.greendice);
                                });
                                getSumAndNidurstada();
                                widget.updateParentState(diceRollerObject);
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
                                  diceRollerObject.greendice = updateDiceResult(
                                      -1, diceRollerObject.greendice);
                                });
                                getSumAndNidurstada();
                                widget.updateParentState(diceRollerObject);
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
                          diceRollerObject.bluedice != null
                              ? "assets/images/bluedice-${diceRollerObject.bluedice}.png"
                              : "assets/images/blueblank.png",
                          width: 120,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  diceRollerObject.bluedice = updateDiceResult(
                                      1, diceRollerObject.bluedice);
                                });
                                getSumAndNidurstada();
                                widget.updateParentState(diceRollerObject);
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
                                  diceRollerObject.bluedice = updateDiceResult(
                                      -1, diceRollerObject.bluedice);
                                });
                                getSumAndNidurstada();
                                widget.updateParentState(diceRollerObject);
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
                ? '$yellowRedSum (${DiceLogic.nidurstodur(diceRollerObject.yellowDiceRoll ?? 0, diceRollerObject.redDiceRoll ?? 0)}) (${greenBlueNidurstada})'
                : '${yellowRedSum != 0 ? yellowRedSum : ''} ${diceRollerObject.yellowDiceRoll != null && diceRollerObject.redDiceRoll != null ? DiceLogic.nidurstodur(diceRollerObject.yellowDiceRoll ?? 0, diceRollerObject.redDiceRoll ?? 0) : ''}',
            style: const TextStyle(fontSize: 20, color: Colors.white60),
          ),
          if (doublesText.isNotEmpty)
            Text(
              doublesText,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
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
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.white60),
                ),
                backgroundColor: Colors.orange.shade100),
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
