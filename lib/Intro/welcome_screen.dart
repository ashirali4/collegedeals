import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class welcomescreen extends StatefulWidget {
  @override
  _verifyEmailState createState() => _verifyEmailState();
}

class _verifyEmailState extends State<welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 150,),
              Container(
                height: 130,
                width: 100,
                child: new Image.asset(
                  'assets/splashlogo.png',
                ),
              ),
              SizedBox(height: 150),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      new Text('Welcome Aboard!',
                        style: TextStyle(
                          color: Color(0xff1D262C),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, left: 48, right: 47),
                        child: Container(
                          child: new Text('Signup to get started with the app. Login if you already have an account.',
                            style: TextStyle(
                              color: Color(0xff71828A),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(height: 78),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Container(
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
                                Navigator.pushNamed(context, "SignUp");
                              },
                              child: Text('Signup with Email',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,

                                  fontFamily:'Poppins',
                                ),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),

                        child: FlatButton(
                          onPressed: () {
                           Navigator.pushNamed(context, "login");
                          },
                          child: Text(
                            "Login to my Account",
                            style: TextStyle(
                                color: Color(0xff1D262C)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
}
