import 'package:flutter/material.dart';
import 'package:lokaverk/Vitni.dart';

import 'dice_roller.dart';
// import 'package:vonandi/flotturTexti.dart';



class GradientContainerRGBY extends StatelessWidget {
  const GradientContainerRGBY(
      this.color1, this.color2, this.color3,
      {super.key});

  const GradientContainerRGBY.litir({super.key})
      : color1 = Colors.blue,
        color2 = Colors.orangeAccent,
        color3 = Colors.orange;


  final Color color1;
  final Color color2;
  final Color color3;


  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3 ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
      children: [
        Expanded(
            child: DiceRoller(),
          ),
        Expanded(
            child: Vitni(),
        ),
      ],
      ),
    );
  }
}




/*
class GradientContainerRGBY extends StatelessWidget {
  const GradientContainerRGBY({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: flottAlignment,
          end: flottEndAlignment,
        ),
      ),
      child: const Center(
        child: flotturTexti("Hæ NTV"),
      ),
    );
  }
}
 */
