import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class get_started extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/doted_bg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0,left: 70.0,right: 70.0),
                child: new Image.asset(
                  'assets/collegedealslogo.png',
                ),
              ),
              SizedBox(height: 40),

              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/sticker.png',
                      width: 280,
                      height: 232,
                    ),
                    SizedBox(height: 30),
                    new Text('Cheers to Discounts!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 50, right: 50),
                      child: Container(
                        child: new Text('Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis nibh lacinia at.',
                          style: TextStyle(
                            color: Color(0xff71828A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        width: 335,
                        height: 44,
                        child: new FlatButton(

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            color: Color(0xff36845B),
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            // padding: EdgeInsets.all(10.0),
                            onPressed:(){
                              Navigator.pushNamed(context, "towardslogin");
                            },
                            child: Text('Get Started',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily:'Poppins',
                              ),)),
                      ),
                    ),
                    SizedBox(height: 50)

                    // new Image.asset(
                    //   'assets/text.png',
                    //   width: 280,
                    //   height: 108,
                    // ),

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

