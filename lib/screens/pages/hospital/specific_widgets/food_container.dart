import 'package:flutter/material.dart';

import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

Widget foodContainer(
    String imagename, String title, String description, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: image(
              'assets/images/' + imagename,
              250,
              250,
              const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
            ),
          ),
        ),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: color,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(title, 24, Colors.white),
                const SizedBox(height: 10),
                text(description, 12, Colors.white),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
