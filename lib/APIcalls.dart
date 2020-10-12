import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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
    "email_address" : "arslan.awan163@gmail.com",
    "password" : "arslan"
  };
    FormData formData = FormData.fromMap(map);
    Response<Map> response = await dio.post(apiurl, data: formData);
    if(response.statusCode==200){
      LoginApiModel model=loginApiModelFromJson(response.toString());
      return model;
    }
    else{
      LoginApiModel model=loginApiModelFromJson(response.toString());
      return model;
    }
  }


}


