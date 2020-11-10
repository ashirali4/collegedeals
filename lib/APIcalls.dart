import 'dart:convert';

import 'package:collegedeals/APIModels/Fetch_Blog_Post.dart';
import 'package:collegedeals/APIModels/Forgot_pass_API.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'APIModels/Home_DEALS_model.dart';
import 'APIModels/Homepage_FAashion_model.dart';
import 'APIModels/Login_API_Model_Response.dart';
import 'package:collegedeals/APIModels/Fetch_Blog_Categoires.dart';

import 'APIModels/UserInfoApiModel.dart';

//Future<String> funct() async {
//  final prefs = await SharedPreferences.getInstance();
//  final myString = prefs.getString('usertoken') ?? '';
//  return myString;
//}
class MyApi {

  //static String token="vB29MKjEsxRkZdmp2xqx";
  String apiurl="https://collegedeals.in/action.php";

  static final MyApi _singleton = MyApi._internal();
  factory MyApi() {
//    Future<String> ashir = funct();
//    ashir.then((data) {
//     token=data.toString();
//    },onError: (e) {
//      print(e);
//    });
    return _singleton;
  }
  MyApi._internal();








  // API CALL FOR LOGIN
  Future<LoginApiModel> signin(String email,String password) async {
    var dio = Dio();
    Map<String,dynamic> map=new Map<String,dynamic>();
    map={
    "login_submit" : 1,
    "email_address" : email,
    "password" : password
  };
    FormData formData = FormData.fromMap(map);
    var response = await dio.post(apiurl, data: formData);
    if(response.statusCode==200){
      LoginApiModel model=loginApiModelFromJson(response.toString());
      return model;
    }
    else{
      LoginApiModel model=loginApiModelFromJson(response.toString());
      return model;
    }
  }

 // for forgot pass
  Future<Forgetpass> forgotpass(String email) async {
    var dio = Dio();
    Map<String,dynamic> map=new Map<String,dynamic>();
    map={
      "email_address" : email,
      "forget_submit" : 1,

    };
    FormData formData = FormData.fromMap(map);
    var response = await dio.post(apiurl, data: formData);
    if(response.statusCode==200){
      Forgetpass model=forgetpassFromJson(response.toString());
      return model;
    }
    else{
      Forgetpass model=forgetpassFromJson(response.toString());
      return model;
    }
  }
  // API FOR THE FETCH HOME DEALS

  Future<FetchHomeDeals> fetch_home_deals() async {
    String url= apiurl+'?fetch_home_deals=1/';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      FetchHomeDeals list=fetchHomeDealsFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      FetchHomeDeals list=fetchHomeDealsFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }
  // API FOR THE blogposts

  Future<FetchBlogPost> topblogposts() async {
    String url= apiurl+'?fetch_popular_blog_posts=1/';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      FetchBlogPost list=fetchBlogPostFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      FetchBlogPost list=fetchBlogPostFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }





  Future<FetchBlogPost> catewisefetch(String id) async {
    String url= apiurl+'?fetch_blog_posts=1&main_cat='+id+'/';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      FetchBlogPost list=fetchBlogPostFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      FetchBlogPost list=fetchBlogPostFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }


  Future<FashionPost> topfashionposts() async {
    String url= apiurl+'?fetch_brand_details=1&brand_auto_id=1/';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      FashionPost list=fashionPostFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      FashionPost list=fashionPostFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }


  Future<UserInfo> fetchuserinfo() async {
    String url= apiurl+'?fetch_user_info=1/';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      UserInfo list=userInfoFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      UserInfo list=userInfoFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }

  Future<BlogMainCategoires> fetblogcate() async {
    String url= apiurl+'?fetch_blog_main_categories=1';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      BlogMainCategoires list=blogMainCategoiresFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      BlogMainCategoires list=blogMainCategoiresFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }
}


