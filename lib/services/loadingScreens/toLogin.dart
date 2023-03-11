import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/auth/login_page.dart';

class LoadingScreenToLogIn extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<LoadingScreenToLogIn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Get.off(() => const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Image(
                        width: 220,
                        image: AssetImage('assets/images/logoonly.png'),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
