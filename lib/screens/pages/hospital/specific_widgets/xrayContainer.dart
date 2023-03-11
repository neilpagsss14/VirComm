import 'package:flutter/material.dart';
import 'package:new_app/widgets/text.dart';

Widget xray(String path, String txt) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
    child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(path), fit: BoxFit.cover, opacity: 0.5),
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 350,
        child: Center(child: text(txt, 18, Colors.white))),
  );
}
