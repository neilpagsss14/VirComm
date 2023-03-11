import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../farm/specific_widgets/crop_webview.dart';

class FireStationPage extends StatelessWidget {
  const FireStationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: text('Fire Station', 24, Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => CropWebView(
                    link:
                        'https://www.aarp.org/home-family/your-home/info-2019/fire-prevention.html'));
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
                      Stack(
                        children: const [
                          Icon(
                            Icons.shield_sharp,
                            size: 120,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35, left: 35),
                            child: Icon(
                              Icons.local_fire_department_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      text('Prevent Fire', 18, Colors.red),
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
                        color: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      text('Call Emergency', 18, Colors.red),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
