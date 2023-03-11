import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/gym/specific_widgets/workout_container.dart';
import 'package:new_app/widgets/text.dart';
import 'package:get/get.dart';

import '../../home.dart';

class GymPage extends StatefulWidget {
  const GymPage({Key? key}) : super(key: key);

  @override
  State<GymPage> createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> {
  late int _index = 0;
  final List<bool> _isSelected = [true, false];

  late int height = 0;
  late int weight = 0;
  late int age = 0;

  late String gender = '';

  @override
  void initState() {
    super.initState();
  }

  late String times = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: text('Home Workout', 24, Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              IndexedStack(
                index: _index,
                children: [
                  Center(
                    child: Column(
                      children: [
                        text('Choose your Gender', 10, Colors.black),
                        const SizedBox(
                          height: 10,
                        ),
                        ToggleButtons(
                            borderRadius: BorderRadius.circular(5),
                            splashColor: Colors.grey,
                            color: Colors.black,
                            selectedColor: Colors.blue,
                            children: const [
                              Icon(Icons.male),
                              Icon(Icons.female),
                            ],
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < _isSelected.length;
                                    index++) {
                                  if (index == newIndex) {
                                    _isSelected[index] = true;
                                    if (_isSelected[0] == true) {
                                      gender = 'Male';
                                    } else {
                                      gender = 'Female';
                                    }
                                  } else {
                                    _isSelected[index] = false;
                                  }
                                }
                              });
                            },
                            isSelected: _isSelected),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                          child: TextFormField(
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                color: Colors.black, fontFamily: 'Quicksand'),
                            onChanged: (_input) {
                              age = int.parse(_input);
                            },
                            decoration: InputDecoration(
                              suffix: const Text('yrs old'),
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: 'Age',
                              labelStyle: const TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                          child: TextFormField(
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                color: Colors.black, fontFamily: 'Quicksand'),
                            onChanged: (_input) {
                              height = int.parse(_input);
                            },
                            decoration: InputDecoration(
                              suffix: const Text('cm'),
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: 'Height',
                              labelStyle: const TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                          child: TextFormField(
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                color: Colors.black, fontFamily: 'Quicksand'),
                            onChanged: (_input) {
                              weight = int.parse(_input);
                            },
                            decoration: InputDecoration(
                              suffix: const Text('kg'),
                              fillColor: Colors.grey[200],
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: 'Weight',
                              labelStyle: const TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.black,
                          onPressed: () {
                            if (gender == 'Male') {
                              if (age > 14 && age < 25) {
                                setState(() {
                                  times = '20';
                                });
                              } else if (age > 26 && age < 35) {
                                setState(() {
                                  times = '30';
                                });
                              } else {
                                setState(() {
                                  times = '15';
                                });
                              }
                            } else {
                              if (age > 14 && age < 25) {
                                setState(() {
                                  times = '15';
                                });
                              } else if (age > 26 && age < 35) {
                                setState(() {
                                  times = '25';
                                });
                              } else {
                                setState(() {
                                  times = '10';
                                });
                              }
                            }
                            print(times);
                            setState(() {
                              _index = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: text('Continue', 12, Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      workoutContainer('assets/images/situps.gif', 300, 500,
                          'Sit ups', times),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Continue', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      workoutContainer('assets/images/pushup.gif', 300, 500,
                          'Push ups', times),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 3;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Continue', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      workoutContainer(
                          'assets/images/squat.gif', 300, 500, 'Squat', times),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 4;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Continue', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      workoutContainer('assets/images/jj.gif', 300, 500,
                          'Jumping Jacks', times),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 5;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Continue', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      workoutContainer('assets/images/plank.gif', 300, 500,
                          'Plank', '25sec'),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 6;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Continue', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      workoutContainer('assets/images/buttkick.gif', 300, 500,
                          'Butt kick', times),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 7;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Continue', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: text('Congratulations!', 38, Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child:
                            text('Workout for today is done', 12, Colors.grey),
                      ),
                      const SizedBox(height: 50),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.grey[200],
                        onPressed: () {
                          setState(() {
                            Get.off(() => const Home());
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Home', 12, Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            _index = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: text('Repeat Workout', 12, Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
