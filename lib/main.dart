import 'package:collegedeals/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';
import 'Intro/Getting_Started.dart';
import 'Intro/Getting_Started.dart';
import 'SingleOfferView/SingleService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('check');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'College Deals',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: email == 'yes' ? home_page() : get_started(),
    onGenerateRoute: generateRoute,
  ));
}



