import 'package:flutter/material.dart';

import 'dice_roller.dart';
// import 'package:vonandi/flotturTexti.dart';

const flottAlignment = Alignment.topRight;
const flottEndAlignment = Alignment.bottomLeft;

class GradientContainerRGBY extends StatelessWidget {
  const GradientContainerRGBY(
      this.color1, this.color2, this.color3, this.color4,
      {super.key});

  const GradientContainerRGBY.litir({super.key})
      : color1 = Colors.red,
        color2 = Colors.yellow,
        color3 = Colors.blueAccent,
        color4 = Colors.green;

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3, color4],
          begin: flottAlignment,
          end: flottEndAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(),
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
