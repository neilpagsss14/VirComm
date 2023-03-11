import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/widgets/dialog.dart';

import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

import 'package:new_app/screens/pages/farm/specific_widgets/crop_webview.dart';
import 'package:new_app/screens/pages/farm/specific_widgets/crop_widget.dart';
import 'package:new_app/services/cloud_function/postProduct.dart';
import 'package:new_app/widgets/text.dart';
import 'package:get/get.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({Key? key}) : super(key: key);

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  late int chipValue = 0;
  late bool s1 = true;
  late bool s2 = false;
  late String link = '';

  late String pic = 'Upload Picture';

  late String productName = '';
  late String price = '';
  late String name = '';
  late String contactNumber = '';
  late String productPicture = '';

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';
  late File imageFile;

  late String imageURL = '';

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = (await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920))!;

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: AlertDialog(
                title: Text(
              '         Loading . . .',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand'),
            )),
          ),
        );

        await firebase_storage.FirebaseStorage.instance
            .ref('PRODUCT/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('PRODUCT/$fileName')
            .getDownloadURL();

        setState(() {
          pic = 'Uploaded Succesfully';
        });

        Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: text('Farm & Market', 22, Colors.white),
            centerTitle: true,
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.landscape_rounded),
                  const SizedBox(height: 5),
                  text('Farm', 14, Colors.white),
                  const SizedBox(height: 10),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.store),
                  const SizedBox(height: 5),
                  text('Market', 14, Colors.white),
                  const SizedBox(height: 10),
                ],
              ),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728343/how-to-grow-corn';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/corn.png', 'Corn'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13406992/how-to-grow-kalabasa-philippine-squash';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/kalabasa.png', 'Kalabasa'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728271/how-to-grow-eggplant';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/eggplant.png', 'Eggplant'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728507/how-to-grow-bananas';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/banana.png', 'Banana'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728342/how-to-grow-cabbage';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/cabbage.png', 'Cabbage'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728349/how-to-grow-onions';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/onion.png', 'Onion'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728269/how-to-grow-garlic';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/garlic.png', 'Garlic'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        link =
                            'https://www.hunker.com/13728266/how-to-grow-carrots';
                        Get.to(() => CropWebView(link: link));
                      });
                    },
                    child: crop('assets/images/carrots.png', 'Carrots'),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              onSelected: (value) {
                                setState(() {
                                  s1 = value;
                                  chipValue = 0;
                                  s2 = false;
                                });
                              },
                              selectedColor: Colors.green[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Buy', 18, Colors.black),
                              selected: s1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              onSelected: (value) {
                                setState(() {
                                  s2 = value;
                                  chipValue = 1;
                                  s1 = false;
                                });
                              },
                              selectedColor: Colors.green[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Sell', 18, Colors.black),
                              selected: s2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IndexedStack(
                  index: chipValue,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Product')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print('error');
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            print('waiting');
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.green,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            height: 500,
                            child: GridView.builder(
                              itemCount: snapshot.data?.size ?? 0,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: ((context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(data.docs[index]
                                                ['productPicture'])),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                      ),
                                      height: 100,
                                      width: 150,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                      ),
                                      height: 80,
                                      width: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          text(data.docs[index]['productName'],
                                              16, Colors.white),
                                          text(
                                              data.docs[index]['price'] +
                                                  'php/kilo',
                                              12,
                                              Colors.white),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          text(data.docs[index]['name'], 14,
                                              Colors.white),
                                          text(
                                              '+639' +
                                                  data.docs[index]
                                                      ['contactNumber'],
                                              10,
                                              Colors.white),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 450,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                _upload('gallery');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 40,
                                width: 150,
                                child:
                                    Center(child: text(pic, 12, Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 20, 80, 5),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  productName = _input;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Product Name',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(120, 5, 120, 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  price = _input;
                                },
                                decoration: InputDecoration(
                                  suffix: const Text('php/kilo'),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Price',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 20, 80, 5),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  name = _input;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(100, 5, 100, 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 9,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  contactNumber = _input;
                                },
                                decoration: InputDecoration(
                                  prefix: const Text('+639'),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Contact Number',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: Colors.green,
                              onPressed: () {
                                postProduct(productName, price, name,
                                    contactNumber, imageURL);
                                dialogHome();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: text('Post', 12, Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 250,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ])),
    );
  }
}
