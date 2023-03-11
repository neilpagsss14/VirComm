import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/hospital/pages/dietitian/dietitian.dart';
import 'package:new_app/screens/pages/hospital/pages/doctor/consultation_page.dart';
import 'package:new_app/screens/pages/hospital/pages/psychiatrist/psychiatrist_page.dart';
import 'package:new_app/screens/pages/hospital/pages/xray/brain_page.dart';
import 'package:new_app/screens/pages/hospital/pages/xray/breast_page.dart';
import 'package:new_app/screens/pages/hospital/pages/xray/covid_page.dart';
import 'package:new_app/screens/pages/hospital/specific_widgets/xrayContainer.dart';
import 'package:get/get.dart';
import 'package:new_app/widgets/container.dart';
import 'package:new_app/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'specific_widgets/doctor.dart';

class HospitalPage extends StatefulWidget {
  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  bool _selected = true;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;

  late int chipValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: text('Hospital', 22, Colors.white),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 15),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      text('Welcome,', 32, Colors.black),
                      const SizedBox(
                        height: 5,
                      ),
                      text(
                          'Find A Doctor & Specialist easily', 10, Colors.grey),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                        onPressed: () async {
                          String driverContactNumber = '09090104355';
                          final _text = 'tel:$driverContactNumber';
                          if (await canLaunch(_text)) {
                            await launch(_text);
                          }
                        },
                        icon: const Icon(
                          Icons.power_settings_new_rounded,
                          color: Colors.white,
                          size: 32,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    container('assets/images/covid.png', 'CONQUER\nCOVID-19',
                        'Get tested for Covid 19'),
                    container('assets/images/doctor.png',
                        'Doctor\nConsultation', 'Free doctor check up'),
                    container('assets/images/food.png', 'Eat\nHealthy',
                        'Learn personal diet'),
                    container('assets/images/mind.png', 'Heal\nyour Mind',
                        'Free psychiatrist consultation'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ChoiceChip(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          avatar: const Image(
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                              image: AssetImage('assets/images/Dietitian.png')),
                          onSelected: (value) {
                            setState(() {
                              _selected = value;
                              chipValue = 0;
                              _selected2 = false;
                              _selected3 = false;
                              _selected4 = false;
                            });
                          },
                          selectedColor: Colors.blue[200],
                          disabledColor: Colors.white,
                          backgroundColor: Colors.white,
                          label: text('Dietitian', 14, Colors.black),
                          selected: _selected),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ChoiceChip(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          avatar: const Image(
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                              image:
                                  AssetImage('assets/images/doctorlogo.png')),
                          onSelected: (value) {
                            setState(() {
                              _selected2 = value;
                              chipValue = 1;
                              _selected = false;
                              _selected3 = false;
                              _selected4 = false;
                            });
                          },
                          selectedColor: Colors.blue[200],
                          disabledColor: Colors.white,
                          backgroundColor: Colors.white,
                          label: text('Doctor', 14, Colors.black),
                          selected: _selected2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ChoiceChip(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          avatar: const Image(
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                              image:
                                  AssetImage('assets/images/Psychiatrist.png')),
                          onSelected: (value) {
                            setState(() {
                              _selected3 = value;
                              chipValue = 2;
                              _selected2 = false;
                              _selected = false;
                              _selected4 = false;
                            });
                          },
                          selectedColor: Colors.blue[200],
                          disabledColor: Colors.white,
                          backgroundColor: Colors.white,
                          label: text('Psychiatrist', 14, Colors.black),
                          selected: _selected3),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ChoiceChip(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          avatar: const Image(
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                              image: AssetImage('assets/images/xray.png')),
                          onSelected: (value) {
                            setState(() {
                              _selected4 = value;
                              chipValue = 3;
                              _selected2 = false;
                              _selected3 = false;
                              _selected = false;
                            });
                          },
                          selectedColor: Colors.blue[200],
                          disabledColor: Colors.white,
                          backgroundColor: Colors.white,
                          label: text('Detection', 14, Colors.black),
                          selected: _selected4),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IndexedStack(
                index: chipValue,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const DietitianPage(),
                          transition: Transition.zoom);
                    },
                    child: Hero(
                      tag: 'jane',
                      child: doctor(
                          "assets/images/doctor1.png", 'Dr. Jane', 'Dietitian'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ConsultationPage(),
                          transition: Transition.zoom);
                    },
                    child: Hero(
                      tag: 'may',
                      child: doctor(
                        "assets/images/doctor3.png",
                        'Dr. May',
                        'Doctor',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const DialogflowPsychiatrist(),
                          transition: Transition.zoom);
                    },
                    child: Hero(
                      tag: 'maricel',
                      child: doctor("assets/images/doctor2.png", 'Dr. Maricel',
                          'Psychiatrist'),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CovidPage(),
                                transition: Transition.zoom);
                          },
                          child: xray("assets/images/chest.png",
                              'Covid 19,\nPneumonia,\nLung Opacity'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BrainPage(),
                                transition: Transition.zoom);
                          },
                          child:
                              xray("assets/images/brain.jpg", 'Brain\nTumor'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BreastPage(),
                                transition: Transition.zoom);
                          },
                          child: xray(
                              "assets/images/breast.jpg", 'Breast\nCancer'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
