import 'package:cloud_firestore/cloud_firestore.dart';

Future postSkill(
    String name, String contactNumber, String picture, String job) async {
  final docUser =
      FirebaseFirestore.instance.collection('Job').doc(contactNumber);

  final json = {
    'name': name,
    'contactNumber': contactNumber,
    'picture': picture,
    'job': job,
  };

  await docUser.set(json);
}
