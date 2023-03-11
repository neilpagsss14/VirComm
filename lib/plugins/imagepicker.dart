import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

Future<void> uploadPhoto(String inputSource, String productPicture,
    String fileName, File imageFile, String imageURL) async {
  final picker = ImagePicker();
  XFile pickedImage;
  try {
    pickedImage = (await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920))!;

    fileName = path.basename(pickedImage.path);
    imageFile = File(pickedImage.path);

    try {
      Get.defaultDialog(
        middleText: '         Loading . . .',
      );
      await firebase_storage.FirebaseStorage.instance
          .ref('PRODUCT/$fileName')
          .putFile(imageFile);
      imageURL = await firebase_storage.FirebaseStorage.instance
          .ref('PRODUCT/$fileName')
          .getDownloadURL();

      productPicture = 'Uploaded Succesfully';

      Get.back();
    } on firebase_storage.FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}
