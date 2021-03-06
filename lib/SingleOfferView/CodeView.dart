import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
class CodeView extends StatefulWidget {
  String code;
  @override
  _SingleServiceViewState createState() => _SingleServiceViewState();
  CodeView(this.code);
}

class _SingleServiceViewState extends State<CodeView> {
  bool ali;
  String text;
  bool visbleornot=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text=widget.code;
    ali = widget.code.contains('http');
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(

          child: Container(
            width: MediaQuery.of(context).size.width,

            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
              child: Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: (
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: Icon(Icons.arrow_back
                                          ),
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: (
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(

                                          child: Icon(Icons.share
                                          ),
                                          onTap: (){
                                            Share.share('Checkout the Great Deal here :'+ widget.code, subject: 'CollegeDeals Deals');

                                          },
                                        ),

                                      ],
                                    )
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          sectionlist(),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
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
                              Navigator.pop(context);
                              Navigator.pop(context);

                            },
                            child: Text('Back to Home',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily:'Poppins',
                                  fontWeight: FontWeight.bold
                              ),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget sectionlist(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 05),
          child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Image.asset("assets/done.png"),
                  SizedBox(height: 20,),
                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 05),
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
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 40,bottom:40),
                  child: Column(
                    children: [
                      Text('Promotion Code',
                        style: TextStyle(
                          color: Color(0xff1D262C),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.start,),
                      // Text('4 5 6 7 8 ',
                      //   style: TextStyle(
                      //     color: Color(0xff36845B),
                      //     fontSize: 28,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: 'Poppins',
                      //   ),
                      //   textAlign: TextAlign.start,),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(flex:15,child: FlatButton(
                              color: ali==true ? Color(0xff36845B):Color(0xff8fd1ae),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              textColor: Colors.white,
                              disabledColor: Color(0xff8fd1ae),
                              // padding: EdgeInsets.all(10.0),

                              onPressed: ali==true ?  () async {
                                var url = widget.code;
                                await launch(url);
                              }:null,
                              child: Text('DISCOUNT LINK',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily:'Poppins',
                                    fontWeight: FontWeight.bold
                                ),))),
                          Expanded(flex:1,child: SizedBox(width: 1,)),
                          Expanded(flex:15,child: FlatButton(

                              color: ali==true ?Color(0xff8fd1ae): Color(0xff36845B),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              textColor: Colors.white,
                              disabledColor: Color(0xff8fd1ae),
                              // padding: EdgeInsets.all(10.0),
                              onPressed: ali==true ? null: () async {
                                     setState(() {
                                       visbleornot=true;
                                     });
                              },


                              child: Text('REVEAL CODE',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily:'Poppins',
                                    fontWeight: FontWeight.bold
                                ),)))

                        ],
                      ),
                      SizedBox(height: 20,),
                      Visibility(
                        child: Text(text,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily:'Poppins',
                              fontWeight: FontWeight.bold
                          ),),
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: visbleornot,
                      ),


                    ],

                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
