import 'package:cloud_firestore/cloud_firestore.dart';

Future postMyEvent(String eventName, String time, String location,
    String participants, String eventPicture) async {
  final docUser =
      FirebaseFirestore.instance.collection('Events').doc(eventName);

  final json = {
    'eventName': eventName,
    'time': time,
    'location': location,
    'participants': participants,
    'eventPicture': eventPicture,
  };

  await docUser.set(json);
}
