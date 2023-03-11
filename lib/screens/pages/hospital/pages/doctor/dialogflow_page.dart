import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../widgets/text.dart';

class DialogflowDoctor extends StatelessWidget {
  const DialogflowDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl:
                'https://console.dialogflow.com/api-client/demo/embedded/447e0945-5508-4dd4-993d-7ee480302ea9',
          ),
          Container(
            width: double.infinity,
            height: 110,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Hero(
                    tag: 'may',
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 27.5,
                      minRadius: 27.5,
                      backgroundImage: AssetImage(
                        'assets/images/doctor3.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  text(
                    'Dr. May',
                    24,
                    Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
