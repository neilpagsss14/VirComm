import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/home.dart';

void logInWithFacebook() async {
  try {
    final facebookLogInResult = await FacebookAuth.instance.login();

    final userData = await FacebookAuth.instance.getUserData();

    final facebookAuthCredential =
        FacebookAuthProvider.credential(facebookLogInResult.accessToken!.token);

    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    Get.off(const Home());
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
