import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff36845B),
        title: Text("Support - CollegeDeals"),
      ),
      body: Container(
        child:  WebView(
          initialUrl: 'https://collegedeals.in/about_us.php',
        ),
      ),
    );
  }
}
