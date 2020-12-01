import 'dart:io';
import 'dart:async';


import 'package:collegedeals/SignupSignin/Signup.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passwordfield/passwordfield.dart';

class Signupnext extends StatefulWidget {
  email_password info;
  @override
  _signup1State createState() => _signup1State();
  Signupnext(this.info);
}
bool _passwordVisible = false;
class _signup1State extends State<Signupnext> {
  final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();
  String email;
  String mobile;
  String insitute;
  String city;
  String state;
  final picker = ImagePicker();

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
                                     hintText: 'abc@gmail.com',
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
                                     hintText: 'e.g : Dehli',
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
                                       return 'State is required';
                                     }

                                     return null;

                                   },
                                   onSaved: (String value){
                                     state=value;
                                   },
                                   style: TextStyle(
                                     fontFamily: "Poppins",
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   keyboardType: TextInputType.emailAddress,
                                   decoration: new InputDecoration(
                                     labelText: 'State',
                                     labelStyle: TextStyle(
                                       fontFamily: "Poppins",
                                       fontSize: 15,
                                       color: Color(0xff36845B),
                                     ),
                                     hintText: 'e.g: Punjab',
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
                                        File _image;

                                        final pickedFile = await picker.getImage(source: ImageSource.gallery);

                                        setState(() {
                                          if (pickedFile != null) {
                                            _image = File(pickedFile.path);
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
                                    child: Text('No File Choosen',
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
                                  onPressed:(){
                                    if(!_formKey.currentState.validate()) {
                                      return;
                                    }
                                    _formKey.currentState.save();
                                    print(email);
                                    print(mobile);
                                    print(insitute);
                                    print(city);
                                    print(state);
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
