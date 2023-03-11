import 'package:flutter/material.dart';

class NewHome extends StatelessWidget {
  var types = [
    'Hospital',
    'Municipal Hall',
    'Market and Farm',
    'Gym',
    'Rescue Station',
    'Police Station',
    'Fire Station'
  ];

  NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: types.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(),
              ),
            );
          }),
    );
  }
}
