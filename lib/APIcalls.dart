import 'dart:convert';

import 'package:collegedeals/APIModels/Fetch_Blog_Post.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'APIModels/Home_DEALS_model.dart';
import 'APIModels/Login_API_Model_Response.dart';

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
}


