import 'dart:math';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/APIModels/UserInfoApiModel.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../APIcalls.dart';

class Profile_Screen extends StatefulWidget {
  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  bool value=true;
  Future<UserInfo> userinfo;
  MyApi myapi=new MyApi();
String name="";
String email="";
String id="";

   getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String s = prefs.getString("email");
    String ss = prefs.getString("name");
    String sss = prefs.getString("id");
    setState(() {
      name=ss;
      email=s;
      id=sss;
    });
  }
  @override
  void initState() {
    getStringValuesSF();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    userinfo=myapi.fetchuserinfo();
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),





              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Your Profile',
                  style: TextStyle(
                    color: Color(0xff1D262C),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,),
              ),


              profilelist(),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                child: Text('Update your Details below',
                  style: TextStyle(
                    color: Color(0xff1D262C),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,),
              ),
              // list(Icons.mail_outline,"Change Email",pass()),
              // list(Icons.security,"Change Password",pass()),



              InkWell(
                onTap: () async {

                  Navigator.pushNamed(context, "aboutus");
                },
                child:  list(Icons.info_outline_rounded," About Us",pass()),
              ),

              InkWell(
                onTap: () async {

                  Navigator.pushNamed(context, "support");
                },
                child:  list(Icons.phone_android_outlined," Support",pass()),
              ),

              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('check', 'no');
                  Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                },
                child:  list(Icons.exit_to_app," Logout",pass()),
              ),




            ],
          ),
        ),
      ),
    );
  }
 Widget list(IconData assetimage,String text,Widget name){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 05,right: 05,top: 05),
          child: Container(
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0XffEAECF3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 0.75)
                )
              ],

              color: Colors.white,),

            child: Card(
              elevation:0.0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),

              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 05,bottom: 05),
                  child: Column(
                    children: [
                      Listitemsettings( assetimage, text, name),

                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget profilelist(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 05,right: 05,top: 05),
          child: Container(
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0XffEAECF3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 0.75)
                )
              ],

              color: Color(0xff36845B),),

            child: Card(
              elevation:0.0,
              color: Color(0xff36845B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),

              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: profilesection(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget profilesection() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [

          Container(
            width: 80.0,
            height: 80.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new AssetImage("assets/e.png"),
                fit: BoxFit.contain,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
          ),
          SizedBox(width: 15,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(email,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.start,),
              SizedBox(height: 03,),
              Row(
                children: [
                  Icon(Icons.mail_outline,size: 15,color: Colors.white,),
                  Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,),
                ],
              ),
              SizedBox(height: 03,),

              Row(
                children: [
                  Icon(Icons.perm_identity,size: 15,color: Colors.white,),
                  Text(" Student ID: "+id,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,),
                ],
              ),

            ],
          ),

        ],
      ),
    );

  }
  Widget Listitemsettings(IconData assetimage,String text,Widget name){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            width: 40,
            child: Icon(assetimage,
              color: Colors.black.withOpacity(.5),

            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(text,
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.start,),
        ),
        Expanded(
          flex: 1,
          child: name,
        )
      ],
    );
  }
  Widget pass(){
    return Container(
      child: Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.5),size: 15,),
    );
  }
  Widget swithnotify(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
        width: 60,
        child: Switch(
          onChanged: (dd){
            setState(() {
              value=dd;
            });
          },
          value: value,
          activeColor:  Color(0xff36845B),
        )
    ),
      ],
    );
  }
}
