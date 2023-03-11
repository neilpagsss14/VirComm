import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/screens/pages/hospital/specific_widgets/chest_result.dart';
import 'package:tflite/tflite.dart';

import '../../../../../widgets/dialog.dart';
import '../../../../../widgets/text.dart';

class CovidPage extends StatefulWidget {
  @override
  State<CovidPage> createState() => _HomePageState();
}

class _HomePageState extends State<CovidPage> {
  late String output = '';

  late File pickedImage;

  bool isImageLoaded = false;

  late List result;

  late String accuracy = '';

  late String name = '';

  late String numbers = '';

  var _index = 0;

  getImageCamera() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModel(File(tempStore.path));
    });
  }

  getImageGallery() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModel(File(tempStore.path));
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model/covid.tflite', labels: 'assets/model/covid.txt');
  }

  applyModel(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      result = res!;
      print('result:' + result.toString());
      String str = result[0]['label'];

      name = str.substring(2);
      accuracy = result != null
          ? (result[0]['confidence'] * 100.0).toString().substring(0, 2) + '%'
          : '';

      if (result[0]['index'] == 0) {
        _index = 2;
      } else if (result[0]['index'] == 1) {
        _index = 4;
      } else if (result[0]['index'] == 2) {
        _index = 1;
      } else if (result[0]['index'] == 3) {
        _index = 3;
      } else {
        _index = 0;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              dialogCloseOnly('X-Ray');
            },
            icon: const Icon(Icons.info_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              isImageLoaded
                  ? Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            File(pickedImage.path),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Container(
                      height: 250,
                      width: 250,
                      color: Colors.white,
                    ),
              const SizedBox(
                height: 20,
              ),
              text(
                'Result',
                18,
                Colors.black,
              ),
              IndexedStack(
                index: _index,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      child: Center(
                        child: text(
                          'Not yet Scanned',
                          14,
                          Colors.black,
                        ),
                      ),
                    ),
                  ),
                  chestResult(
                    'healthy.png',
                    'Normal',
                    '',
                    accuracy,
                  ),
                  chestResult(
                    'covid1.jpg',
                    'Covid 19\nPositive',
                    'Coronavirus disease (COVID-19) is an infectious disease caused by the SARS-CoV-2 virus.',
                    accuracy,
                  ),
                  chestResult(
                    'pneumonia.jpg',
                    'Pneumonia',
                    'An infection of the air sacs in one or both the lungs. Characterized by severe cough with phlegm, fever, chills and difficulty in breathing',
                    accuracy,
                  ),
                  chestResult(
                    'lungopacity.png',
                    'Lung\nOpacity',
                    'A lung opacity is a frequently used term by radiologists on chest X-rays and essentially means a white spot of uncertain significance.',
                    accuracy,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      getImageCamera();
                    },
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 32,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            text(
                              'Camera',
                              18,
                              Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getImageGallery();
                    },
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.photo_size_select_actual_rounded,
                              color: Colors.white,
                              size: 32,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            text(
                              'Gallery',
                              18,
                              Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
