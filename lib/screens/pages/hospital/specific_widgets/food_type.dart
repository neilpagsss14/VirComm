import 'package:flutter/material.dart';

import '../../../../widgets/text.dart';

Widget foodtype(String title, IconData icon, Color iconColor, Color textColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 32,
        ),
        const SizedBox(
          width: 20,
        ),
        text(title, 28, textColor),
      ],
    ),
  );
}
