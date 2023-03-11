import 'package:flutter/material.dart';

Widget text(String txt, double size, Color color) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'QBold',
    ),
  );
}
