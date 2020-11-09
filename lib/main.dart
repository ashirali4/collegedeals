import 'package:collegedeals/router.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'Intro/Getting_Started.dart';
import 'Intro/Getting_Started.dart';
import 'SingleOfferView/SingleService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Deals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: get_started(),
      onGenerateRoute: generateRoute,
    );
  }
}

