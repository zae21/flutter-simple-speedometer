import 'package:flutter/material.dart';

double mstoKmh(double speed) {
  double conversion = 3.6;
  double result = speed * conversion;
  return result;
}

Color speedColor(double speed) {
  Color result = Colors.black;
  if (speed < 40) {
    result = Colors.green;
  } else if (speed < 60) {
    result = Colors.blue;
  } else if (speed < 80) {
    result = Colors.amber;
  } else if (speed > 80) {
    result = Colors.red;
  }
  return result;
}

TextStyle dsStyleText(double? fontSize, double? f) {
  return TextStyle(
      fontFamily: 'DS-Digital',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: speedColor(f!));
}
