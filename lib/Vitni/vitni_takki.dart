import 'package:flutter/material.dart';

class VitniTakki extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;


  VitniTakki({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(
            Colors.white60,
          ),
          foregroundColor: MaterialStateProperty.all<Color?>(
            Colors.black,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
              side: const BorderSide(
                color: Colors.white60,
                width: 2,
              ),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(150, 50),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20, // Adjust the font size
          ),
        ),
      ),
    );
  }
}