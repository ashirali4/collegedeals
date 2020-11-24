import 'package:collegedeals/Dashboard.dart';
import 'package:collegedeals/Intro/Getting_Started.dart';
import 'package:collegedeals/SignupSignin/Login.dart';
import 'package:collegedeals/SignupSignin/Signupnext.dart';
import 'package:collegedeals/SignupSignin/resetpassword.dart';
import 'package:collegedeals/SingleOfferView/CodeView.dart';
import 'package:collegedeals/SingleOfferView/SingleBrandView.dart';
import 'package:flutter/material.dart';

import 'BrandsFetch/Sub_CategoriesWiseFetch.dart';
import 'Intro/welcome_screen.dart';
import 'SignupSignin/Signup.dart';
import 'SignupSignin/forget_pass.dart';
import 'SingleOfferView/SingleService.dart';
import 'SingleOfferView/Viewblog.dart';
import 'SingleOfferView/cat_wise_blog.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
var signuparg=settings.arguments;
var singleview=settings.arguments;
var code=settings.arguments;
var blog=settings.arguments;
var blogg=settings.arguments;
var mainautoid=settings.arguments;
var singleviewbrand=settings.arguments;


switch (settings.name) {


    case 'towardslogin':
      return MaterialPageRoute(builder: (context) => welcomescreen());
    case 'SignUp':
      return MaterialPageRoute(builder: (context) => signup1());
    case 'Signupnext':
      return MaterialPageRoute(builder: (context) => Signupnext(signuparg));
    case 'login':
      return MaterialPageRoute(builder: (context) => Login());
    case 'forgetpass':
      return MaterialPageRoute(builder: (context) => Forgot_Pass());
    case 'resetpassword':
      return MaterialPageRoute(builder: (context) => ResetPassword());
    case 'dashboardad':
       return MaterialPageRoute(builder: (context) => home_page());
    case 'viewcode':
      return MaterialPageRoute(builder: (context) => CodeView(code));
    case 'viewsingle':
      return MaterialPageRoute(builder: (context) => SingleServiceView(singleview));
  case 'viewsinglebrand':
    return MaterialPageRoute(builder: (context) => SingleBrandView(singleviewbrand));
    case 'viewblog':
      return MaterialPageRoute(builder: (context) => SingleBlog(blog));
      case 'subcat':
       return MaterialPageRoute(builder: (context) => Subcat_Fetch(mainautoid));
    case 'catewisefetch':
      return MaterialPageRoute(builder: (context) => Cate_Wise_Blog(blogg));

      case 'login':
      return MaterialPageRoute(builder: (context) => Login());
  }
}