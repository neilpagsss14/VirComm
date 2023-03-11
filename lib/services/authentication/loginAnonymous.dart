import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../screens/home.dart';

Future signIn() async {
  FirebaseAuth.instance.signInAnonymously();
  Get.off(const Home());
}
