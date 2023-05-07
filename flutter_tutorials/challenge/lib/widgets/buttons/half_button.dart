// shortcut st

import 'package:flutter/material.dart';

enum eButtonDirection {
  LEFT,
  RIGHT,
  MIDDLE,
}

class HalfButton extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final Color textColor;
  final eButtonDirection direction;

  const HalfButton(
      {super.key,
      required this.buttonText,
      required this.bgColor,
      required this.textColor,
      this.direction = eButtonDirection.LEFT});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: direction == eButtonDirection.LEFT
              ? Radius.circular(35)
              : Radius.zero,
          right: this.direction == eButtonDirection.RIGHT
              ? Radius.circular(35)
              : Radius.zero,
        ),
        color: bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Text(
          this.buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
