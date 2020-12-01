import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/APIModels/Single_Data_Sender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../main.dart';
class SingleServiceView extends StatefulWidget {
  Single_Data_Sender object;
  @override
  _SingleServiceViewState createState() => _SingleServiceViewState();
  SingleServiceView(this.object);
}

class _SingleServiceViewState extends State<SingleServiceView> {
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
                                          Share.share('Checkout the Great Deal here :'+ widget.object.link, subject: 'CollegeDeals Deals');

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
                            String link=widget.object.link;
                            Navigator.pushNamed(context, "viewcode",arguments: link);
                          },
                          child: Text('Reveal Code',
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child:Container(
                          height: 75,
                          width: 75,
                          child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius:28.0,
                                    backgroundImage:
                                    NetworkImage(widget.object.brand_image_name),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 20,
                          child:Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(widget.object.tagline,
                                        style: TextStyle(
                                          color: Color(0xff1D262C),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        ),
                                        textAlign: TextAlign.start,),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 03,),

                                Text('Flat Discounts on Every purchase!',
                                  style: TextStyle(
                                    color: Color(0xff1D262C).withOpacity(.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),),
                                SizedBox(height: 03,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 60,
                                        color: Color(0xffFFDC68).withOpacity(.3),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star
                                                ,size: 18,color: Color(0xffFFDC68),),
                                              Text(' 4.5',
                                                style: TextStyle(
                                                  color: Color(0xff1D262C).withOpacity(.5),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 60,
                                        color: Color(0xffCF1E43).withOpacity(.3),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text('15 DAYS',
                                                style: TextStyle(
                                                  color: Color(0xffCF1E43).withOpacity(.5),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          )
                      ),

                    ],
                  ),SizedBox(height: 15,),
                  Center(
                    child: SizedBox(
                        height: 140.0,
                        width: 335.0,
                        child: Carousel(
                          images: [
                            AssetImage('assets/ads.png'),
                            AssetImage('assets/ads2.png'),
                          ],
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.lightGreenAccent,
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.transparent,
                          borderRadius: true,
                        )
                    ),
                  ),
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
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                       children: [
                         Text('Offer Details',
                           style: TextStyle(
                             color: Color(0xff1D262C),
                             fontSize: 15,
                             fontWeight: FontWeight.w400,
                             fontFamily: 'Poppins',
                           ),
                           textAlign: TextAlign.start,),
                       ],
                     ),


                      Container(
                        child: Text(widget.object.Description,
                          maxLines: 8,
                          style: TextStyle(
                            color: Color(0xff1D262C).withOpacity(.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.start,),
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
