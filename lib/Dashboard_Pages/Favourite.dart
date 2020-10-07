import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:flutter/material.dart';

class Favourite_Screen extends StatefulWidget {
  @override
  _Favourite_ScreenState createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Favourite',
                  style: TextStyle(
                    color: Color(0xff1D262C),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,),
              ),

              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewsingle");
                },),
              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewsingle");
                },),
              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewsingle");
                },),
              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewsingle");
                },),
            ],
          ),
        ),
      ),
    );
  }
  Widget list(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 05,right: 05,top: 05),
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
                  child: Row(
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
                                    AssetImage('assets/mc.png'),
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
                                      child: Text('40\$ Off',
                                        style: TextStyle(
                                          color: Color(0xff1D262C),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        ),
                                        textAlign: TextAlign.start,),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.location_on,size: 15,),
                                            Text('1.4 KM'
                                              ,
                                              style: TextStyle(
                                                color: Color(0xff1D262C).withOpacity(.5),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Poppins',
                                              ),)
                                          ],
                                        )
                                    )
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 60,
                                        color: Color(0xff0074E4).withOpacity(.3),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text('FOOD',
                                                style: TextStyle(
                                                  color: Color(0xff0074E4),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
