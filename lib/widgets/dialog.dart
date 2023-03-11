import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:new_app/screens/home.dart';

dialog(String title, String message, Widget gt) {
  return Get.defaultDialog(
    radius: 5.0,
    title: title,
    middleText: message,
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text(
        'Close',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    confirm: Padding(
      padding: const EdgeInsets.only(left: 50),
      child: TextButton(
        onPressed: () {
          Get.back();
          Get.to(() => gt, transition: Transition.zoom);
        },
        child: const Text(
          'Continue',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}

dialogWithoutClose(String title, String message, Widget gt) {
  return Get.defaultDialog(
    radius: 5.0,
    title: title,
    middleText: message,
    confirm: Padding(
      padding: const EdgeInsets.only(left: 0),
      child: TextButton(
        onPressed: () {
          Get.back();
          Get.off(() => gt, transition: Transition.zoom);
        },
        child: const Text(
          'Continue',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}

dialogCloseOnly(String message) {
  return Get.defaultDialog(
    radius: 5.0,
    title: '',
    middleText: message,
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text(
        'Close',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}

dialogHome() {
  return Get.defaultDialog(
    radius: 5.0,
    title: 'Posted Succesfully!',
    middleText: '',
    barrierDismissible: false,
    confirm: TextButton(
      onPressed: () {
        Get.off(() => const Home());
      },
      child: const Text(
        'Continue',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}
