import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collegedeals/APIModels/Blog_Sender.dart';

import '../main.dart';
class SingleBlog extends StatefulWidget {
  Blog_Sender rec;

  @override
  _SingleServiceViewState createState() => _SingleServiceViewState();
  SingleBlog(this.rec);
}

class _SingleServiceViewState extends State<SingleBlog> {
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
                                        Icon(Icons.share
                                        ),
                                        SizedBox(width: 10,),
                                        Icon(Icons.star_border
                                        )
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                     Expanded(
                       flex: 3,
                       child:  Text(widget.rec.title,
                         style: TextStyle(
                           color: Color(0xff1D262C),
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Poppins',
                         ),
                         textAlign: TextAlign.start,
                         maxLines: 3,),
                     ),
                      Expanded(
                        flex: 1,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            height: 25.0,
                            width: 60,
                            color: Color(0xff36845B),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(widget.rec.by,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  )
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

                      Text(widget.rec.description, style: TextStyle(
                          color: Color(0xff1D262C).withOpacity(.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.start,),


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
