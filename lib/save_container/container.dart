import 'package:flutter/material.dart';
import 'package:lokaverk/classes/classes.dart';
import '../throwing/dice_roller.dart';
import '../Vitni/Vitni.dart';


class Save extends StatefulWidget {
  const Save({Key? key}) : super(key: key);

  @override
  _SaveState createState() => _SaveState();
}



class _SaveState extends State<Save> {
  int? yellowThrow;
  int? redThrow;
  int? greenThrow;
  int? blueThrow;
  String? kastari;
  String? framVitni;
  String? bakVitni;
  String? soluVitni;
  String? kassaVitni;
  String? nidurstada;


  void updateDiceState(DiceRollerObject diceRoller) {
    setState(() {
      yellowThrow = diceRoller?.yellowDiceRoll;
      redThrow = diceRoller?.redDiceRoll;
      greenThrow = diceRoller?.greendice;
      blueThrow = diceRoller?.bluedice;
      nidurstada = diceRoller?.nidurstada;
    });

  }

  void updateVitniState(VitniObject vitniSelect) {
    setState(() {
      kastari = vitniSelect?.kastari;
      framVitni = vitniSelect?.framendiVitni;
      bakVitni = vitniSelect?.bakendiVitni;
      soluVitni = vitniSelect?.soludeildVitni;
      kassaVitni = vitniSelect?.kassadeildVitni;
    });
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DiceRoller(updateParentState: updateDiceState),
          Vitni(updateParentState: updateVitniState),
        ],
      ),
    );
  }
}