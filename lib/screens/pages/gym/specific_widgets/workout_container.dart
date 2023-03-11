import 'package:flutter/material.dart';

import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

Widget workoutContainer(
    String path, double height, double width, String workout, String times) {
  return Column(
    children: [
      image(path, height, width, EdgeInsets.zero),
      text(workout + ' ' + times, 28, Colors.black),
      const SizedBox(
        height: 50,
      ),
    ],
  );
}
