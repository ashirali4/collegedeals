import 'package:collegedeals/APIModels/Login_API_Model_Response.dart';
import 'package:collegedeals/APIModels/verifyemail.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Verifyemaisl extends StatefulWidget {
  String email;
  @override
  _signup1State createState() => _signup1State();
  Verifyemaisl(this.email);
}
bool _passwordVisible = false;
class _signup1State extends State<Verifyemaisl> {
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  @override
  void initState() {
    email.text=widget.email;
    _passwordVisible = false;
  }
  MyApi myapi=new MyApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                height: 150,
                width: 150,
                child: new Image.asset(
                  'assets/splashlogo.png',
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    new Text('Email Verification',
                      style: TextStyle(
                        color: Color(0xff1D262C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 48, right: 47),
                      child: Container(
                        child: new Text('Please check your Email for verifcation',
                          style: TextStyle(
                            color: Color(0xff71828A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        child: Column(
                          children:[
                            new TextFormField(
                              enabled: false,
                              controller: email,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                labelText: 'Email',
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
                              controller: password,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Verification Code',
                                //contentPadding :const EdgeInsets.only(bottom: 10,top:10),
                                labelStyle: TextStyle(

                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  color: Color(0xff36845B),
                                ),
                                hintText: 'XXXXXX',
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
                            SizedBox(height: 65),
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
                                    Verifyemail response= await myapi.verifymail(password.text, widget.email);

                                    if(response.status=="Success"){
                                      Navigator.pop(context);
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
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    new Icon(Icons.check,size: 30,),
                                                    SizedBox(width: 20,),
                                                    new Container(
                                                      child:  Text("Success") ,
                                                    ),
                                                    SizedBox(width: 40,),

                                                    RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                          side: BorderSide(color: Color(0xff36845B),)),
                                                      onPressed: () {

                                                        Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                                                      },
                                                      color: Color(0xff36845B),
                                                      textColor:Colors.white,
                                                      child: Text("Login Now".toUpperCase(),
                                                          style: TextStyle(fontSize: 12)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    else{
                                      Navigator.pop(context);
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Failed",
                                        desc: "Unable to Sign Up",
                                      ).show();
                                    }

                                  },
                                  child: Text('Verify Email',
                                    style: TextStyle(
                                      fontSize: 12,
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
class email_password{
  String email;
  String password;
  email_password(this.email,this.password);
}
