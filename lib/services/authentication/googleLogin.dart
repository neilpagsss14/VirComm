import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/screens/home.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

void logInWithGoogle() async {
  try {
    final googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return;
    }
    final googleSignInAuth = await googleSignInAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuth.accessToken,
      idToken: googleSignInAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.off(() => const Home());
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
