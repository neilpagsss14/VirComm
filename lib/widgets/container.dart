import 'package:flutter/material.dart';
import 'package:new_app/widgets/text.dart';

Widget container(String path, String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
    child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue[200]!,
            Colors.blue[300]!,
            Colors.blue[200]!,
          ]),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 300,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Image(
                fit: BoxFit.contain,
                width: 120,
                height: 120,
                image: AssetImage(path)),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(title, 24, Colors.white),
                const SizedBox(
                  height: 10,
                ),
                text(subtitle, 10, Colors.white),
              ],
            ),
          ],
        )),
  );
}
