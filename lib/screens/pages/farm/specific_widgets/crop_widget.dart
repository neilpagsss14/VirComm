import 'package:flutter/material.dart';

import '../../../../widgets/text.dart';

Widget crop(String path, String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(
            path,
          ),
        ),
      ),
      height: 150,
      width: 150,
      child: Center(
        child: text(title, 28, Colors.white),
      ),
    ),
  );
}
