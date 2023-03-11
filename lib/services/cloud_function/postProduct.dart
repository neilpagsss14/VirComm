import 'package:cloud_firestore/cloud_firestore.dart';

Future postProduct(String productName, String price, String name,
    String contactNumber, String productPicture) async {
  final docUser =
      FirebaseFirestore.instance.collection('Product').doc(contactNumber);

  final json = {
    'productName': productName,
    'price': price,
    'name': name,
    'contactNumber': contactNumber,
    'productPicture': productPicture,
  };

  await docUser.set(json);
}
