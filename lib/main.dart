import 'package:flutter/material.dart';

import 'gradientContainerRGBY.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: GradientContainerRGBY.litir(),
      ),
    ),
  );
}
