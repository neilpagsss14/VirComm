import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/widgets/text.dart';
import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicePage extends StatelessWidget {
  final Telephony telephony = Telephony.instance;

  late String report = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: text('Police Station', 24, Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.grey[200],
                            title: text('Sending Report', 12, Colors.grey),
                            content: SizedBox(
                              height: 250,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 5),
                                    child: TextFormField(
                                      maxLines: 5,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand'),
                                      onChanged: (_input) {
                                        report = _input;
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        labelText: 'Enter Report',
                                        labelStyle: const TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    color: Colors.blue,
                                    onPressed: () {
                                      telephony.sendSms(
                                          to: '09090104355', message: report);
                                      Get.off(() => PolicePage());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50),
                                      child: text('Send', 12, Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
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
                          Icons.report,
                          size: 120,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        text('Send Report', 18, Colors.blue),
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
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        text('Call Emergency', 18, Colors.blue),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
