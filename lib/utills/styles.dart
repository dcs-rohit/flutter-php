import 'package:flutter/material.dart';

TextStyle myTextStyle({FontWeight fontWeight, double fontSize, Color color}) {
  return TextStyle(
      fontSize: fontSize ?? 16,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal);
}
