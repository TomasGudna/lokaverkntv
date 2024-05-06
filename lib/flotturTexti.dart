import 'package:flutter/material.dart';


class flotturTexti extends StatelessWidget {
  const flotturTexti(this.text,{super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 30,
      ),
    );
  }

}