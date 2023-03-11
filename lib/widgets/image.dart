import 'package:flutter/material.dart';
import 'package:new_app/widgets/text.dart';

Widget image(
  String path,
  double height,
  double width,
  EdgeInsets e,
) {
  return Padding(
    padding: e,
    child: Image(
        fit: BoxFit.contain,
        width: width,
        height: height,
        image: AssetImage(path)),
  );
}

Widget image1(
  String path,
  double height,
  double width,
  EdgeInsets e,
) {
  return Padding(
    padding: e,
    child: Image(
        fit: BoxFit.fill,
        width: width,
        height: height,
        image: AssetImage(path)),
  );
}

Widget image2(
    String path, double width, double height, String txt, double size) {
  return Stack(children: [
    Image(
      width: width,
      height: height,
      image: AssetImage(path),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(75, 90, 30, 0),
      child: text(txt, size, Colors.white),
    ),
  ]);
}

Widget image3(
    String path, double width, double height, String txt, double size) {
  return Stack(children: [
    Image(
      width: width,
      height: height,
      image: AssetImage(path),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(115, 115, 30, 0),
      child: text(txt, size, Colors.white),
    ),
  ]);
}

Widget image4(
    String path, double width, double height, String txt, double size) {
  return Stack(children: [
    Image(
      width: width,
      height: height,
      image: AssetImage(path),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(115, 160, 30, 0),
      child: text(txt, size, Colors.white),
    ),
  ]);
}

Widget imageOnline(
  String path,
  double height,
  double width,
  EdgeInsets e,
  String name,
) {
  return Padding(
    padding: e,
    child: Image(
        fit: BoxFit.contain,
        width: width,
        height: height,
        image: NetworkImage(path)),
  );
}
