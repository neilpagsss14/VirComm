import 'package:flutter/material.dart';

import '../../../../widgets/text.dart';

Widget doctor(String path, String name, String type) {
  return Column(
    children: [
      text(
        '1 Doctor',
        12,
        Colors.black,
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(path), fit: BoxFit.fitHeight)),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: 180,
            width: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(name, 22, Colors.white),
                const SizedBox(
                  height: 10,
                ),
                text(type, 10, Colors.white),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
