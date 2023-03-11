import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/hospital/pages/dietitian/food.dart';
import 'package:new_app/widgets/image.dart';
import 'package:new_app/widgets/text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class DietitianPage extends StatefulWidget {
  const DietitianPage({Key? key}) : super(key: key);

  @override
  State<DietitianPage> createState() => _DietitianPageState();
}

class _DietitianPageState extends State<DietitianPage> {
  final box = GetStorage();
  var heightValue = 120.0;
  var weightValue = 30.0;
  var gender = 'Male';

  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Hero(
                    tag: 'jane',
                    child: image("assets/images/doctor1.png", 220, 220,
                        EdgeInsets.zero)),
                const SizedBox(
                  height: 10,
                ),
                text('Dr. Jane wants to know your:', 14, Colors.black),
                const SizedBox(
                  height: 40,
                ),
                text('Gender', 10, Colors.black),
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
                const SizedBox(
                  height: 20,
                ),
                text('Height (cm)', 10, Colors.black),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Slider(
                    min: 120,
                    max: 250,
                    value: heightValue,
                    label: '$heightValue',
                    onChanged: (value) {
                      setState(() {
                        heightValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                text(heightValue.toStringAsFixed(0) + 'cm', 18, Colors.black),
                const SizedBox(
                  height: 20,
                ),
                text('Weight (kg)', 10, Colors.black),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Slider(
                    min: 30,
                    max: 100,
                    value: weightValue,
                    label: '$weightValue',
                    onChanged: (value) {
                      setState(() {
                        weightValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                text(weightValue.toStringAsFixed(0) + 'kg', 18, Colors.black),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    var height = heightValue * 0.01;
                    var totalHeight = height * height;

                    var bmi = weightValue / totalHeight;
                    if (int.parse(bmi.toStringAsFixed(0)) <= 18) {
                      print('underweight');
                      box.write('bmi', 'underweight');
                    } else if (int.parse(bmi.toStringAsFixed(0)) >= 19 &&
                        int.parse(bmi.toStringAsFixed(0)) <= 25) {
                      print('normal');
                      box.write('bmi', 'normal');
                    } else if (int.parse(bmi.toStringAsFixed(0)) >= 26 &&
                        int.parse(bmi.toStringAsFixed(0)) <= 30) {
                      print('overweight');
                      box.write('bmi', 'overweight');
                    } else if (int.parse(bmi.toStringAsFixed(0)) >= 31) {
                      print('obese');
                      box.write('bmi', 'obese');
                    }
                    Get.to(() => const FoodPage(), transition: Transition.zoom);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: text('Continue', 14, Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
