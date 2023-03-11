import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/widgets/image.dart';
import 'package:new_app/widgets/text.dart';

Widget modalChild(
    String imagepath, String name, String features, Widget w, Color color) {
  return SizedBox(
    height: 500,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image(imagepath, 175, 175, const EdgeInsets.fromLTRB(0, 0, 0, 0)),
        const SizedBox(
          height: 10,
        ),
        text(name, 24, Colors.black),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 350,
          child: Center(child: text(features, 14, Colors.black)),
        ),
        const SizedBox(
          height: 5,
        ),
        text('Feature', 12, Colors.black),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: color,
          onPressed: () {
            Get.off(() => w, transition: Transition.zoom);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: text('Enter', 12, Colors.white),
          ),
        ),
      ],
    ),
  );
}
