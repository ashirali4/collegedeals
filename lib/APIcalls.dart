import 'dart:convert';
import 'dart:io';

import 'package:collegedeals/APIModels/Fetch_Blog_Post.dart';
import 'package:collegedeals/APIModels/Forgot_pass_API.dart';
import 'package:collegedeals/APIModels/Signup_Response_API.dart';
import 'package:collegedeals/APIModels/SingleBrandDetailsApiModel.dart';
import 'package:collegedeals/BrandsFetch/Sub_CategoriesWiseFetch.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'APIModels/Fetch_Brands_From_Subcat.dart';
import 'APIModels/Home_DEALS_model.dart';
import 'APIModels/Homepage_FAashion_model.dart';
import 'APIModels/Login_API_Model_Response.dart';
import 'package:collegedeals/APIModels/Fetch_Blog_Categoires.dart';

import 'APIModels/SearchAPI.dart';
import 'APIModels/SubCatFetch.dart';
import 'APIModels/UserInfoApiModel.dart';
import 'APIModels/verifyemail.dart';

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


  Future<Verifyemail> verifymail(String passcode,String email) async {
    var dio = Dio();
    Map<String,dynamic> map=new Map<String,dynamic>();
    map={
      "verify_email" : 1,
      "email_address" : email,
      "confirmation_code" : passcode
    };
    FormData formData = FormData.fromMap(map);
    var response = await dio.post(apiurl, data: formData);
    if(response.statusCode==200){
      Verifyemail model=verifyemailFromJson(response.toString());
      return model;
    }
    else{

      Verifyemail model=verifyemailFromJson(response.toString());
      return model;
    }
  }




  Future<SignupResponse> signup(String fullname,String email,String password,String mobile,String ins,String town,String state,
      File file) async {
    var dio = Dio();
    String fileName = file.path.split('/').last;

    Map<String,dynamic> map=new Map<String,dynamic>();
    map={
      "join_submit" : 1,
      "full_name" : fullname,
      "email_address" : email,
      "password" : password,
      "mobile_number" : mobile,
      "institution_full_name" : ins,
      "town_city" : town,
      "state" : state,
      "institution_proof" : await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    };
    FormData formData = FormData.fromMap(map);
    var response = await dio.post(apiurl, data: formData);
    if(response.statusCode==200){
      SignupResponse model=signupResponseFromJson(response.toString());
      print(response);
      return model;
    }
    else{
      print(response);

      SignupResponse model=signupResponseFromJson(response.toString());
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

  Future<FetchHomeDeals> fetchalldeals() async {
    String url= apiurl+'?fetch_all_deals=1';
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




  Future<SearchBrands> searchbrands(String search) async {
    String url= apiurl+'?submit_search_brand=1&search_query='+search;
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      SearchBrands list=searchBrandsFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      SearchBrands list=searchBrandsFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }





  Future<Fetchbrandsfromsub> subcatbrands(String id) async {
    String url= apiurl+'?fetch_sub_cat_linked_brands=1&auto_id='+id;
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      Fetchbrandsfromsub list=fetchbrandsfromsubFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      Fetchbrandsfromsub list=fetchbrandsfromsubFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }







  //fetch the home top deals
  Future<Fetchbrandsfromsub> hometopdeals() async {
    String url= apiurl+'?fetch_sub_cat_linked_brands=1&auto_id=24';
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      Fetchbrandsfromsub list=fetchbrandsfromsubFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      Fetchbrandsfromsub list=fetchbrandsfromsubFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }




  // API FOR THE blogposts

  Future<FetchBlogPost> topblogposts() async {
    String url= apiurl+'?fetch_blog_posts_java=1&main_cat=1';
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
    String url= apiurl+'?fetch_blog_posts_java=1&main_cat='+id+'/';
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


  Future<List<Subcatfetchapi>> subcatlist(int id) async {
    String url= apiurl+'?fetch_sub_categories=1&main_cat_auto_id='+id.toString();
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      List<Subcatfetchapi> list=subcatfetchapiFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      List<Subcatfetchapi> list=subcatfetchapiFromJson(responsestring);
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




  //Single BrnadView Fetch

  //fetch the home top deals
  Future<SingleBrandDetails> singlebrandview(String id) async {
    String url= apiurl+'?fetch_brand_deals=1&brand_auto_id='+id;
    final response= await http.get(url);
    if(response.statusCode==200){
      final String responsestring=response.body;
      SingleBrandDetails list=singleBrandDetailsFromJson(responsestring);
      return list;
    }
    else{
      final String responsestring=response.body;
      SingleBrandDetails list=singleBrandDetailsFromJson(responsestring);
      // print(list.length);
      return list;
    }
  }
}


