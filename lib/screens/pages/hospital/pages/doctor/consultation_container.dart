import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/pages/hospital/pages/doctor/dialogflow_page.dart';
import '../../../../../widgets/image.dart';
import '../../../../../widgets/text.dart';

Widget consultationContainer(String imageSource, String title) {
  return GestureDetector(
    onTap: () {
      Get.to(() => const DialogflowDoctor(), transition: Transition.zoom);
    },
    child: Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Center(
              child: text(
                title,
                24,
                Colors.white,
              ),
            ),
          ),
          Container(
            height: 120,
            width: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: image1(
              'assets/images/' + imageSource,
              0,
              0,
              const EdgeInsets.only(
                left: 5,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
