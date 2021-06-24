import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);
  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://google.com',
        ),
      ),
    );
  }
}
