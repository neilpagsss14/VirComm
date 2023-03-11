import 'package:cloud_firestore/cloud_firestore.dart';

Future postJobOffer(String name, String contactNumber, String job) async {
  final docUser =
      FirebaseFirestore.instance.collection('Job Offer').doc(contactNumber);

  final json = {
    'name': name,
    'contactNumber': contactNumber,
    'job': job,
  };

  await docUser.set(json);
}
