import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/hospital/pages/doctor/consultation_container.dart';
import 'package:new_app/widgets/image.dart';
import 'package:new_app/widgets/text.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    text(
                      'Dr. May:',
                      14,
                      Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    text(
                      '"Choose a subject\nfor Consultation"',
                      12,
                      Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Hero(
                  tag: 'may',
                  child: image(
                    'assets/images/doctor3.png',
                    220,
                    220,
                    EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    consultationContainer(
                      'asthma.png',
                      'Asthma',
                    ),
                    consultationContainer(
                      'dengue.jpg',
                      'Dengue',
                    ),
                    consultationContainer(
                      'diabetes.jpg',
                      'Diabetes',
                    ),
                    consultationContainer(
                      'headache.jpg',
                      'Headache',
                    ),
                    consultationContainer(
                      'fever.jpg',
                      'Fever',
                    ),
                    consultationContainer(
                      'flu.jpg',
                      'Flu',
                    ),
                    consultationContainer(
                      'highblood.jpg',
                      'Highblood\nPressue',
                    ),
                    consultationContainer(
                      'pneumonia.jpg',
                      'Pneumonia',
                    ),
                    consultationContainer(
                      'stomachache.jpg',
                      'Stomach\nache',
                    ),
                    consultationContainer(
                      'uti.png',
                      'UTI',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
