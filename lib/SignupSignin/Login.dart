import 'package:collegedeals/APIModels/Login_API_Model_Response.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Dashboard.dart';

class Login extends StatefulWidget {
  @override
  _signup1State createState() => _signup1State();
}
bool _passwordVisible = false;
class _signup1State extends State<Login> {
  bool radio=true;
  String name;
  @override
  void initState() {
    _passwordVisible = false;
  }
  MyApi loginapi=new MyApi();
  LoginApiModel logindetails=new LoginApiModel();
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
                    new Text('Login',
                      style: TextStyle(
                        color: Color(0xff1D262C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 48, right: 47),
                      child: Container(
                        child: new Text('Welcome back, login to continue!',
                          style: TextStyle(
                            color: Color(0xff71828A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        child: Column(
                          children:[
                            new TextField(
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
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisible,//This will obscure text dynamically
                              decoration: InputDecoration(
                                labelText: 'Password',
                                //contentPadding :const EdgeInsets.only(bottom: 10,top:10),
                                labelStyle: TextStyle(

                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  color: Color(0xff36845B),
                                ),
                                hintText: '********',
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
                                suffixIcon: IconButton(

                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),

                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      InkWell(

                                        child: Container(
                                          child:   radio
                                              ? Icon(
                                            Icons.not_interested,
                                            size: 20.0,
                                            color: Color(0xff71828A),
                                          )
                                              : Icon(
                                            Icons.check_circle,
                                            size: 20.0,
                                            color: Color(0xff36845B),
                                          ),

                                        ),
                                        onTap: (){
                                          setState(() {
                                            radio = !radio;
                                          });
                                        },
                                      ),

                                      InkWell(
                                        child: Text('  Remember me',
                                          style: TextStyle(
                                            color: Color(0xff71828A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            radio = !radio;
                                          });
                                        }
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      InkWell(
                                        child: Text('Forgot password?',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                            )),
                                        onTap: (){
                                          Navigator.pushNamed(context, "forgetpass");
                                        },
                                      )
                                    ],
                                  )
                                )
                              ],
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
                                    name="";
                                    logindetails=await loginapi.signin("email", "password");
                                    _onLoading(context, logindetails.status);




                                    //_onLoading(context,name);
                                  },
                                  child: Text('Login',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily:'Poppins',
                                      fontWeight: FontWeight.bold
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

  void _onLoading(BuildContext context,String response) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Container(
                child: response==null ? Text("Loading") : Text(response),
              )
            ],
          ),
        );
      },
    );
    if(response=="succes"){
      new Future.delayed(new Duration(seconds: 3), () {
        Navigator.pop(context); //pop dialog
        Navigator.pushNamed(context, "dashboardad");
      });
    }
    else{
      Navigator.pop(context); //pop dialog

      Alert(
        context: context,
        type: AlertType.warning,
        title: "RFLUTTER ALERT",
        desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "FLAT",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
            child: Text(
              "GRADIENT",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    }
  }
}
