import 'package:collegedeals/APIModels/Forgot_pass_API.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Forgot_Pass extends StatefulWidget {
  @override
  _signup1State createState() => _signup1State();
}
bool _passwordVisible = false;
class _signup1State extends State<Forgot_Pass> {
   MyApi api=new MyApi();
   TextEditingController emailc=new TextEditingController();
   @override
  void initState() {
    _passwordVisible = false;
  }

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
                    new Text('Forget Password',
                      style: TextStyle(
                        color: Color(0xff1D262C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 48, right: 47),
                      child: Container(
                        child: new Text('Enter your email to change your password',
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
                              controller: emailc,
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

                            SizedBox(height: 100),


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
                                    Forgetpass pss=new Forgetpass();
                                    pss= await api.forgotpass(emailc.text);
                                    if(pss.status.isNotEmpty){
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "Success",
                                        desc: "An email has been sent to you!",
                                      ).show();
                                    }
                                    else{
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Error",
                                        desc: "Failed to Reset",
                                      ).show();
                                    }
                                  },
                                  child: Text('Send Email',
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
}
