import 'package:flutter/material.dart';

import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

Widget chestResult(
    String img, String title, String description, String accuracy) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: text(
          'Confidence: ' + accuracy,
          14,
          Colors.black,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(
            'assets/images/' + img,
            100,
            100,
            EdgeInsets.zero,
          ),
          const SizedBox(
            width: 10,
          ),
          text(
            title,
            24,
            Colors.black,
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 70, right: 30),
        child: text(
          '- ' + description,
          12,
          Colors.grey,
        ),
      ),
    ],
  );
}
