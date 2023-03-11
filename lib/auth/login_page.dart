import 'package:flutter/material.dart';
import 'package:new_app/services/authentication/googleLogin.dart';
import 'package:new_app/services/authentication/loginAnonymous.dart';
import 'package:new_app/widgets/image.dart';
import 'package:new_app/widgets/text.dart';

import '../services/authentication/facebookLogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image(
              'assets/images/logowithtext.png',
              250,
              250,
              EdgeInsets.zero,
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: Colors.white,
                onPressed: () {
                  signIn();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image(
                        'assets/images/anonymous.png',
                        25,
                        25,
                        EdgeInsets.zero,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      text('Login Anonymously', 18.0, Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            text('or', 18.0, Colors.black),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: Colors.blue[700],
                onPressed: () {
                  logInWithFacebook();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image(
                        'assets/images/fblogo.png',
                        25,
                        25,
                        EdgeInsets.zero,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      text('Login with Facebook', 18.0, Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: Colors.white,
                onPressed: () {
                  logInWithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image(
                        'assets/images/googlelogo.png',
                        25,
                        25,
                        EdgeInsets.zero,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      text('Login with Google', 18.0, Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
