import 'package:cloud_firestore/cloud_firestore.dart';

Future postAnnouncements(String details, String time) async {
  final docUser =
      FirebaseFirestore.instance.collection('Announcements').doc(details);

  final json = {
    'details': details,
    'time': time,
  };

  await docUser.set(json);
}
