import 'package:collegedeals/Dashboard.dart';
import 'package:collegedeals/Intro/Getting_Started.dart';
import 'package:collegedeals/SignupSignin/Login.dart';
import 'package:collegedeals/SignupSignin/Signupnext.dart';
import 'package:collegedeals/SignupSignin/resetpassword.dart';
import 'package:flutter/material.dart';

import 'Intro/welcome_screen.dart';
import 'SignupSignin/Signup.dart';
import 'SignupSignin/forget_pass.dart';

Route<dynamic> generateRoute(RouteSettings settings) {


  switch (settings.name) {


    case 'towardslogin':
      return MaterialPageRoute(builder: (context) => welcomescreen());
    case 'SignUp':
      return MaterialPageRoute(builder: (context) => signup1());
    case 'Signupnext':
      return MaterialPageRoute(builder: (context) => Signupnext());
    case 'login':
      return MaterialPageRoute(builder: (context) => Login());
    case 'forgetpass':
      return MaterialPageRoute(builder: (context) => Forgot_Pass());
    case 'resetpassword':
      return MaterialPageRoute(builder: (context) => ResetPassword());
    case 'dashboardad':
      return MaterialPageRoute(builder: (context) => home_page());

  }
}