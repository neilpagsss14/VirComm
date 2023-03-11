import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/rescue/evacuation_area.dart';
import 'package:new_app/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class RescuePage extends StatefulWidget {
  const RescuePage({Key? key}) : super(key: key);

  @override
  State<RescuePage> createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: text('Rescue Station', 24, Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => MapSample());
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 120,
                        color: Colors.brown,
                      ),
                      const SizedBox(height: 10),
                      text('Evacuation Areas', 18, Colors.brown),
                    ],
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                String driverContactNumber = '09090104355';
                final _text = 'tel:$driverContactNumber';
                if (await canLaunch(_text)) {
                  await launch(_text);
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.power_settings_new_sharp,
                        size: 120,
                        color: Colors.brown,
                      ),
                      const SizedBox(height: 10),
                      text('Call Emergency', 18, Colors.brown),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
