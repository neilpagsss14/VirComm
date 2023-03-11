import 'package:flutter/material.dart';
import 'package:new_app/widgets/text.dart';

Widget mychip(String txt, String path, bool _selected) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5),
    child: ChoiceChip(
        padding: const EdgeInsets.only(left: 5, right: 5),
        avatar: Image(
            fit: BoxFit.contain,
            width: 20,
            height: 20,
            image: AssetImage(path)),
        onSelected: (value) {
          print(value);
        },
        selectedColor: Colors.blue,
        disabledColor: Colors.white,
        backgroundColor: Colors.white,
        label: text(txt, 14, Colors.black),
        selected: _selected),
  );
}
