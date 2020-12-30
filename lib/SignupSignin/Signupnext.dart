import 'dart:io';
import 'dart:async';


import 'package:collegedeals/APIModels/Signup_Response_API.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:collegedeals/SignupSignin/Signup.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Signupnext extends StatefulWidget {
  email_password info;
  @override
  _signup1State createState() => _signup1State();
  Signupnext(this.info);
}
bool _passwordVisible = false;
class _signup1State extends State<Signupnext> {
  String file="No Image Selected";
  String selectedstate="Andhra Pradesh";
  final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();
  String email;
  String mobile;
  String insitute;
  bool ispickedfi=false;
  String city;
  String state;
  MyApi api=new MyApi();
  final picker = ImagePicker();
  File _image;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    new Text('Step 02',
                      style: TextStyle(
                        color: Color(0xff1D262C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 48, right: 47),
                      child: Container(
                        child: new Text('Signup to get discounts',
                          style: TextStyle(
                            color: Color(0xff71828A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                           Form(
                             key: _formKey
                             ,child:Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 new TextFormField(
                                   validator: (String value) {
                                     if(value.isEmpty){
                                       return 'Email is required';
                                     }



                                     // validator has to return something :)
                                     return null;

                                   },
                                   onSaved: (String value){
                                     email=value;
                                   },
                                   style: TextStyle(
                                     fontFamily: "Poppins",
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   keyboardType: TextInputType.name,
                                   decoration: new InputDecoration(
                                     labelText: 'Full Name',
                                     labelStyle: TextStyle(
                                       fontFamily: "Poppins",
                                       fontSize: 15,
                                       color: Color(0xff36845B),
                                     ),
                                     hintText: 'Your Name',
                                     hintStyle: TextStyle(
                                         fontFamily: "Poppins",
                                         fontSize: 15
                                     ),
                                     enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xffbbbbbb),),
                                     ),
                                     focusedBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xff36845B),),
                                     ),
                                   ),

                                 ),
                                 new TextFormField(
                                   validator: (String value) {
                                     if(value.isEmpty){
                                       return 'Mobile is required';
                                     }

                                     return null;

                                   },
                                   onSaved: (String value){
                                     mobile=value;
                                   },
                                   style: TextStyle(
                                     fontFamily: "Poppins",
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   keyboardType: TextInputType.phone,
                                   decoration: new InputDecoration(
                                     labelText: 'Mobile Number',
                                     labelStyle: TextStyle(
                                       fontFamily: "Poppins",
                                       fontSize: 15,
                                       color: Color(0xff36845B),
                                     ),
                                     hintText: '+91XXXXXXXXXX',
                                     hintStyle: TextStyle(
                                         fontFamily: "Poppins",
                                         fontSize: 15
                                     ),
                                     enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xffbbbbbb),),
                                     ),
                                     focusedBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xff36845B),),
                                     ),
                                   ),

                                 ),
                                 new TextFormField(
                                   validator: (String value) {
                                     if(value.isEmpty){
                                       return 'Institute is required';
                                     }

                                     return null;

                                   },
                                   onSaved: (String value){
                                     insitute=value;
                                   },
                                   style: TextStyle(
                                     fontFamily: "Poppins",
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   keyboardType: TextInputType.emailAddress,
                                   decoration: new InputDecoration(
                                     labelText: 'Institutional Full Name',
                                     labelStyle: TextStyle(
                                       fontFamily: "Poppins",
                                       fontSize: 15,
                                       color: Color(0xff36845B),
                                     ),
                                     hintText: 'Name here',
                                     hintStyle: TextStyle(
                                         fontFamily: "Poppins",
                                         fontSize: 15
                                     ),
                                     enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xffbbbbbb),),
                                     ),
                                     focusedBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xff36845B),),
                                     ),
                                   ),

                                 ),
                                 new TextFormField(
                                   validator: (String value) {
                                     if(value.isEmpty){
                                       return 'City is required';
                                     }

                                     return null;

                                   },
                                   onSaved: (String value){
                                     city=value;
                                   },
                                   style: TextStyle(
                                     fontFamily: "Poppins",
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   keyboardType: TextInputType.emailAddress,
                                   decoration: new InputDecoration(
                                     labelText: 'City/Town',
                                     labelStyle: TextStyle(
                                       fontFamily: "Poppins",
                                       fontSize: 15,
                                       color: Color(0xff36845B),
                                     ),
                                     hintText: 'e.g : Delhi',
                                     hintStyle: TextStyle(
                                         fontFamily: "Poppins",
                                         fontSize: 15
                                     ),
                                     enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xffbbbbbb),),
                                     ),
                                     focusedBorder: UnderlineInputBorder(
                                       borderSide: BorderSide( color: Color(0xff36845B),),
                                     ),
                                   ),

                                 ),
                                 SizedBox(height: 10,),
                                 Text("State",style: TextStyle(
                                   fontFamily: "Poppins",
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                   color: Color(0xff36845B),
                                 ),),
                                 Container(
                                   width: MediaQuery.of(context).size.width,
                                   child: new DropdownButton<String>(
                                     isExpanded: true,
                                     value: selectedstate,
                                     items: <String>["Andhra Pradesh",
                                       "Arunachal Pradesh",
                                       "Assam",
                                       "Bihar",
                                       "Chhattisgarh",
                                       "Goa",
                                       "Gujarat",
                                       "Haryana",
                                       "Himachal Pradesh",
                                       "Jammu and Kashmir",
                                       "Jharkhand",
                                       "Karnataka",
                                       "Kerala",
                                       "Madya Pradesh",
                                       "Maharashtra",
                                       "Manipur",
                                       "Meghalaya",
                                       "Mizoram",
                                       "Nagaland",
                                       "Orissa",
                                       "Punjab",
                                       "Rajasthan",
                                       "Sikkim",
                                       "Tamil Nadu",
                                       "Telagana",
                                       "Tripura",
                                       "Uttaranchal",
                                       "Uttar Pradesh",
                                       "West Bengal",
                                       "Andaman and Nicobar Islands",
                                       "Chandigarh",
                                       "Dadar and Nagar Haveli",
                                       "Daman and Diu",
                                       "Delhi",
                                       "Lakshadeep",
                                       "Pondicherry",].map((String value) {
                                       return new DropdownMenuItem<String>(
                                         value: value,
                                         child: new Text(value,style:TextStyle(
                                           fontFamily: "Poppins",
                                           fontSize: 15,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.black
                                         ),),
                                       );
                                     }).toList(),
                                     onChanged: (value) {
                                       setState(() {
                                         selectedstate=value;
                                       });
                                     },
                                   ),
                                 )
                               ],
                             )
                             ,
                           ),




                            SizedBox(height: 10),
                            Text('Upload Institutional Id card/Proof(Image)',
                              style:  TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff36845B),
                              ),

                             ),
                            SizedBox(height: 10),
                            Container(
                              width: 335,
                              height: 44,
                              child: Row(
                                children: [
                                Expanded(
                                  flex: 5,
                                  child:   FlatButton(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0)),
                                      textColor: Colors.white,
                                      disabledColor: Colors.grey,
                                      // padding: EdgeInsets.all(10.0),
                                      onPressed:() async {


                                        final pickedFile = await picker.getImage(source: ImageSource.gallery);

                                        setState(() {
                                          if (pickedFile != null) {
                                            _image = File(pickedFile.path);
                                            String fileName = pickedFile.path.split('/').last;
                                            ispickedfi=true;
                                            setState(() {
                                              file=fileName;
                                            });
                                          } else {

                                            print('No image selected.');
                                          }
                                        });

                                      },
                                      child: Text('Choose File',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily:'Poppins',
                                        ),)),
                                ),
                                  Expanded(flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(file,
                                      style:  TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.4)
                                      ),
                                    ),
                                  ),),

                                ],
                              )
                            ),

                            SizedBox(height: 35),
                            Container(
                              width: 335,
                              height: 44,
                              child: new FlatButton(
                                  color: Color(0xff36845B),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  // padding: EdgeInsets.all(10.0),
                                  onPressed:() async {
                                    if(_formKey.currentState.validate()) {


                                      if(ispickedfi==true){
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Container(
                                                height: 80,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: new Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      new CircularProgressIndicator(),
                                                      SizedBox(width: 20,),
                                                      new Container(
                                                        child:  Text("Please Wait") ,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        _formKey.currentState.save();
                                        SignupResponse user= await api.signup(email, widget.info.email, widget.info.password, mobile, insitute, city, selectedstate, _image);
                                        if(user.status=="Success"){
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, "verifyy",arguments: widget.info.email);
                                        }
                                        else{
                                          Navigator.pop(context);
                                          showGeneralDialog(
                                            barrierLabel:"Error",
                                            barrierDismissible: true,
                                            barrierColor: Colors.black.withOpacity(0.5),
                                            transitionDuration: Duration(milliseconds: 500),
                                            context: context,
                                            pageBuilder: (_, __, ___) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: Container(
                                                    height: 220,
                                                    width: 220,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.error_outline,size: 80,  color: Color(0xff36845B),),
                                                        SizedBox(height: 30,),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: new Text("Failed to Sign Up",
                                                            style: TextStyle(
                                                              color: Color(0xff71828A),
                                                              fontSize: 12,
                                                              fontFamily: 'Poppins',
                                                            ),
                                                            textAlign: TextAlign.center,),
                                                        ),

                                                      ],
                                                    ),
                                                    margin: EdgeInsets.only(bottom: 20, left: 12, right: 12,top: 40),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            transitionBuilder: (_, anim, __, child) {
                                              return SlideTransition(
                                                position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                                                child: child,
                                              );
                                            },
                                          );
                                        }
                                        print(user);
                                      }

                                      print(email);
                                      print(mobile);
                                      print(insitute);
                                      print(city);
                                      print(selectedstate);
                                      }
                                      else{
                                      showGeneralDialog(
                                        barrierLabel:"No File",
                                        barrierDismissible: true,
                                        barrierColor: Colors.black.withOpacity(0.5),
                                        transitionDuration: Duration(milliseconds: 500),
                                        context: context,
                                        pageBuilder: (_, __, ___) {
                                          return Align(
                                            alignment: Alignment.center,
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Container(
                                                height: 220,
                                                width: 220,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.error_outline,size: 80,  color: Color(0xff36845B),),
                                                    SizedBox(height: 30,),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: new Text("Please choose a File",
                                                        style: TextStyle(
                                                          color: Color(0xff71828A),
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                        textAlign: TextAlign.center,),
                                                    ),

                                                  ],
                                                ),
                                                margin: EdgeInsets.only(bottom: 20, left: 12, right: 12,top: 40),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        transitionBuilder: (_, anim, __, child) {
                                          return SlideTransition(
                                            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                                            child: child,
                                          );
                                        },
                                      );
                                      }

                                  },
                                  child: Text('Complete SignUp',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:'Poppins',
                                    ),)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
