import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class signup1 extends StatefulWidget {
  @override
  _signup1State createState() => _signup1State();
}
bool _passwordVisible = false;
class _signup1State extends State<signup1> {
 TextEditingController email=new TextEditingController();
 TextEditingController password=new TextEditingController();
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
                    new Text('Sign up',
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
                    SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        child: Column(
                          children:[
                            new TextField(
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
                                  onPressed:(){
                                    email_password info=new email_password(email.text,password.text);
                                    Navigator.pushNamed(context, "Signupnext",arguments: info);
                                  },
                                  child: Text('Next',
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
