import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff36845B),
        title: Text("Support - CollegeDeals"),
      ),
      body: Container(
        child:  WebView(
          initialUrl: 'https://collegedeals.in/contact_us.php',
        ),
      ),
    );
  }
}
