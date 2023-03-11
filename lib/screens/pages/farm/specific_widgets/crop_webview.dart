import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CropWebView extends StatelessWidget {
  late String link = '';

  CropWebView({required this.link});

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: link,
    );
  }
}
