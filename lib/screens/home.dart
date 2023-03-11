import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/farm/farm_page.dart';
import 'package:new_app/screens/pages/firestation/firestation_page.dart';
import 'package:new_app/screens/pages/gym/gym_page.dart';
import 'package:new_app/screens/pages/hall/hall_page.dart';

import 'package:new_app/screens/pages/hospital/hospital_page.dart';
import 'package:new_app/screens/pages/police/police_page.dart';
import 'package:new_app/screens/pages/rescue/rescue_page.dart';
import 'package:new_app/widgets/image.dart';
import 'package:new_app/widgets/modal.dart';
import 'package:new_app/widgets/text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.green[800]!,
                      Colors.green[600]!,
                      Colors.green[800]!,
                    ]),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/land.png'),
                        fit: BoxFit.fitHeight)),
                width: double.infinity,
                height: double.infinity,
                child: SafeArea(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => modalChild(
                                'assets/images/gympic.png',
                                'Gym',
                                'Personalized home workout guide without any equipment',
                                const GymPage(),
                                Colors.black),
                          );
                        },
                        child: image('assets/images/gym.png', 120, 120,
                            const EdgeInsets.fromLTRB(250, 380, 0, 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => modalChild(
                                  'assets/images/farmpic.png',
                                  'Market & Farm',
                                  'Guide to manage crops, Buy and sell Agricultural Products',
                                  const FarmPage(),
                                  Colors.green));
                        },
                        child: image('assets/images/farm.png', 280, 280,
                            const EdgeInsets.fromLTRB(100, 130, 0, 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => modalChild(
                                  'assets/images/firepic.png',
                                  'Fire Station',
                                  'Tips to avoid Fire, Call for Emergency',
                                  const FireStationPage(),
                                  Colors.red));
                        },
                        child: image('assets/images/firestation.png', 190, 190,
                            const EdgeInsets.fromLTRB(200, 5, 0, 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => modalChild(
                                  'assets/images/hallpic.png',
                                  'Municipal Hall',
                                  'Be notified about the events in your \ncommunities, Post freelancing service',
                                  const HallPage(),
                                  Colors.amber));
                        },
                        child: image('assets/images/hall.png', 150, 150,
                            const EdgeInsets.fromLTRB(5, 400, 20, 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => modalChild(
                                  'assets/images/hospitalpic.png',
                                  'Hospital',
                                  'Doctor, Psychiatrist, Dietitian Consultation and X-Ray',
                                  HospitalPage(),
                                  Colors.blue));
                        },
                        child: image('assets/images/hospital.png', 150, 150,
                            const EdgeInsets.fromLTRB(0, 100, 0, 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => modalChild(
                                  'assets/images/policepic.png',
                                  'Police Station',
                                  'Send Reports, Call for Emergency',
                                  PolicePage(),
                                  Colors.blue));
                        },
                        child: image('assets/images/police.png', 180, 180,
                            const EdgeInsets.fromLTRB(5, 530, 0, 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => modalChild(
                                  'assets/images/rescuepic.png',
                                  'Rescue Center',
                                  'Evacuation Sites, Call for Emergency',
                                  const RescuePage(),
                                  Colors.brown));
                        },
                        child: image('assets/images/rescye.png', 150, 150,
                            const EdgeInsets.fromLTRB(235, 500, 0, 0)),
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.green[600]!,
                          Colors.green[400]!,
                          Colors.green[600]!,
                        ]),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                        child: text('Virtual Community', 18, Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
