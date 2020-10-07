import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:flutter/material.dart';

class Blog_View extends StatefulWidget {
  @override
  _Favourite_ScreenState createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Blog_View> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),


              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Blog',
                    style: TextStyle(
                      color: Color(0xff1D262C),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},

                              textColor: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/postview.png'),
                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Travel',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},

                              textColor: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/postview.png'),
                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Career',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      )
                  ),

                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},

                              textColor: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/postview.png'),
                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Shopping',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      )
                  ),


                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Recommended for you',
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
                  Navigator.pushNamed(context, "viewblog");
                },),
              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewblog");
                },),
              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewblog");
                },),
              InkWell(child:
              list(),
                onTap: (){
                  Navigator.pushNamed(context, "viewblog");
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
                        flex: 8,
                        child:Container(

                          child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('assets/postview.png'),
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
                                Text('Every Playstation 5 Game Confirmed ',
                                  style: TextStyle(
                                    color: Color(0xff1D262C),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                  textAlign: TextAlign.start,
                                maxLines: 3,),
                                SizedBox(height: 05,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 60,
                                        color: Color(0xff36845B).withOpacity(.6),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text('Tech',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,

                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

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
