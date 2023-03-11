import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/services/cloud_function/postEvent.dart';
import 'package:new_app/services/cloud_function/postSkill.dart';
import 'package:new_app/widgets/dialog.dart';

import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

import 'package:new_app/widgets/image.dart';
import 'package:new_app/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/cloud_function/postAnnouncements.dart';
import '../../../services/cloud_function/postJobOffer.dart';

class HallPage extends StatefulWidget {
  const HallPage({Key? key}) : super(key: key);

  @override
  State<HallPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<HallPage> {
  late int chipValue = 0;
  late bool s1 = true;
  late bool s2 = false;

  late bool s3 = true;
  late bool s4 = false;
  late String link = '';

  late int chipValue1 = 0;

  late String pic = 'Upload Picture';

  late bool s5 = true;
  late bool s6 = false;
  late int chipValue2 = 0;

  late bool s7 = true;
  late bool s8 = false;
  late int chipValue3 = 0;

  // Event

  late String eventName = '';
  late String time = '';
  late String location = '';
  late String participants = '';
  late String eventPicture = '';

  // Work

  late String picture = '';
  late String name = '';
  late String contactNumber = '';
  late String job = '';

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';
  late File imageFile;

  late String imageURL = '';

  late String details = '';

  Future<void> _uploadWork(String inputSource) async {
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
            .ref('Work/$fileName')
            .putFile(imageFile);
        picture = await firebase_storage.FirebaseStorage.instance
            .ref('Work/$fileName')
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

  Future<void> _uploadEvent(String inputSource) async {
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
            .ref('Event/$fileName')
            .putFile(imageFile);
        eventPicture = await firebase_storage.FirebaseStorage.instance
            .ref('Event/$fileName')
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
      length: 4,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: text('Municipal Hall', 22, Colors.white),
            centerTitle: true,
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.event),
                  const SizedBox(height: 5),
                  text('Events', 12, Colors.white),
                  const SizedBox(height: 10),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.announcement),
                  const SizedBox(height: 5),
                  text('Announcements', 8, Colors.white),
                  const SizedBox(height: 10),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person),
                  const SizedBox(height: 5),
                  text('Workers', 12, Colors.white),
                  const SizedBox(height: 10),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.work),
                  const SizedBox(height: 5),
                  text('Job Offers', 12, Colors.white),
                  const SizedBox(height: 10),
                ],
              ),
            ]),
          ),
          body: TabBarView(children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s1 = value;
                                  chipValue = 0;
                                  s2 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Community Events', 12, Colors.black),
                              selected: s1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s2 = value;
                                  chipValue = 1;
                                  s1 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Post Events', 12, Colors.black),
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
                            .collection('Events')
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
                                color: Colors.amber,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                              height: 500,
                              child: Center(
                                child: GridView.builder(
                                  itemCount: snapshot.data?.size ?? 0,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1),
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                            ),
                                            height: 200,
                                            width: 300,
                                            child: imageOnline(
                                                data.docs[index]
                                                    ['eventPicture'],
                                                50,
                                                50,
                                                const EdgeInsets.fromLTRB(
                                                    20, 15, 20, 15),
                                                ''),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                            ),
                                            height: 100,
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                text(
                                                    'What? ' +
                                                        data.docs[index]
                                                            ['eventName'],
                                                    16,
                                                    Colors.white),
                                                text(
                                                    'When? ' +
                                                        data.docs[index]
                                                            ['time'],
                                                    16,
                                                    Colors.white),
                                                text(
                                                    'Where? ' +
                                                        data.docs[index]
                                                            ['location'],
                                                    16,
                                                    Colors.white),
                                                text(
                                                    'Who? ' +
                                                        data.docs[index]
                                                            ['participants'],
                                                    16,
                                                    Colors.white),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ));
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
                                _uploadEvent('gallery');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
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
                                  eventName = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Name of Event',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 5, 80, 5),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  time = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Date and Time',
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
                                  location = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Location',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 5, 80, 5),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  participants = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Participants',
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
                              color: Colors.amber,
                              onPressed: () {
                                postMyEvent(eventName, time, location,
                                    participants, eventPicture);
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
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s5 = value;
                                  chipValue2 = 0;
                                  s6 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Announcements', 12, Colors.black),
                              selected: s5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s6 = value;
                                  chipValue2 = 1;
                                  s5 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label:
                                  text('Post Announcement', 12, Colors.black),
                              selected: s6),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IndexedStack(
                  index: chipValue2,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Announcements')
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
                                color: Colors.amber,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                              height: 500,
                              child: Center(
                                child: GridView.builder(
                                  itemCount: snapshot.data?.size ?? 0,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1),
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                        ),
                                        height: 250,
                                        width: 300,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20,
                                                    left: 20,
                                                    top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    text(
                                                        data.docs[index]
                                                            ['time'],
                                                        14,
                                                        Colors.white),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Center(
                                                child: SizedBox(
                                                  width: 300,
                                                  child: text(
                                                      data.docs[index]
                                                          ['details'],
                                                      12,
                                                      Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ));
                        }),
                    SizedBox(
                      height: 450,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                              child: TextFormField(
                                maxLines: 6,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  details = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Details',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 5, 80, 5),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  time = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Date and Time',
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
                              color: Colors.amber,
                              onPressed: () {
                                postAnnouncements(details, time);
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
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s3 = value;
                                  chipValue1 = 0;
                                  s4 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Skilled Workers', 12, Colors.black),
                              selected: s3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s4 = value;
                                  chipValue1 = 1;
                                  s3 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Write Post', 12, Colors.black),
                              selected: s4),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IndexedStack(
                  index: chipValue1,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Job')
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
                                color: Colors.amber,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            height: 400,
                            child: GridView.builder(
                              itemCount: snapshot.data?.size ?? 0,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: (() async {
                                    final _text =
                                        'tel:${data.docs[index]['contactNumber']}';
                                    if (await canLaunch(_text)) {
                                      await launch(_text);
                                    }
                                  }),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  data.docs[index]['picture'])),
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                        ),
                                        height: 110,
                                        width: 150,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                        ),
                                        height: 60,
                                        width: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            text(data.docs[index]['job'], 16,
                                                Colors.white),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            text(data.docs[index]['name'], 14,
                                                Colors.white),
                                            text(
                                                '09${data.docs[index]['contactNumber']}',
                                                10,
                                                Colors.white),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
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
                                _uploadWork('gallery');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
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
                                  job = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Type of Job/Skill',
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
                                        width: 1, color: Colors.amber),
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
                                        width: 1, color: Colors.amber),
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
                              color: Colors.amber,
                              onPressed: () {
                                postSkill(name, contactNumber, picture, job);
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
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s7 = value;
                                  chipValue3 = 0;
                                  s8 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Job Offers', 12, Colors.black),
                              selected: s7),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ChoiceChip(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              onSelected: (value) {
                                setState(() {
                                  s8 = value;
                                  chipValue3 = 1;
                                  s7 = false;
                                });
                              },
                              selectedColor: Colors.amber[200],
                              disabledColor: Colors.white,
                              backgroundColor: Colors.white,
                              label: text('Post Offer', 12, Colors.black),
                              selected: s8),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IndexedStack(
                  index: chipValue3,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Job Offer')
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
                                color: Colors.amber,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            height: 400,
                            child: GridView.builder(
                              itemCount: snapshot.data?.size ?? 0,
                              itemBuilder: ((context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                      ),
                                      height: 110,
                                      width: 150,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            text('Looking for:', 10,
                                                Colors.amber),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: text(
                                                  data.docs[index]['job'],
                                                  18,
                                                  Colors.amber),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                      ),
                                      height: 60,
                                      width: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          text(data.docs[index]['name'], 18,
                                              Colors.white),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          text(
                                              '09${data.docs[index]['contactNumber']}',
                                              12,
                                              Colors.white),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 20, 80, 5),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {
                                  job = _input;
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Type of Job/Skill',
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Name of Hiring Company/Logistics',
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
                                        width: 1, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Contact Details',
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
                              color: Colors.amber,
                              onPressed: () {
                                postJobOffer(name, contactNumber, job);
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
