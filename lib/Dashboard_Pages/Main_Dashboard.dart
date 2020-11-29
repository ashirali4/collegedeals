import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/APIModels/Fetch_Brands_From_Subcat.dart';
import 'package:collegedeals/APIModels/Home_DEALS_model.dart';
import 'package:collegedeals/APIModels/Homepage_FAashion_model.dart';
import 'package:collegedeals/APIModels/Single_Data_Sender.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/material.dart';

class Dash_Mian extends StatefulWidget {
  @override
  _Dash_MianState createState() => _Dash_MianState();
}

class _Dash_MianState extends State<Dash_Mian> {
  Future<FetchHomeDeals> fetch_home_deals;
  Future<Fetchbrandsfromsub> fashionpsot;
  MyApi apiclass=new MyApi();


  TextEditingController searchc=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    fetch_home_deals=apiclass.fetch_home_deals();
    fashionpsot=apiclass.hometopdeals();
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Center(
                child:   Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 25,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.transparent,
                        primaryColorDark: Colors.transparent,

                      ),
                      child: TextFormField(
                        controller: searchc,
                        decoration: InputDecoration(
                          border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                          contentPadding:
                          EdgeInsets.only(top: 14,bottom: 10,left: 20,right: 10), // add padding to adjust icon
                          isDense: true,
                          hintText: "Search",
                          suffixIcon: Padding(
                            padding:
                            EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 20), // add padding to adjust icon
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "search",arguments: searchc.text);
                              },
                                child: Icon(Icons.search_sharp, size: 25,color: Theme.of(context).primaryColor,)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ),
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

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Categories',
                  style: TextStyle(
                    color: Color(0xff1D262C),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                textAlign: TextAlign.start,),
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
                            color: Color(0xff8B57DF),
                            textColor: Colors.white,
                            child: Icon(
                              MyFlutterAppIcon.deal,
                              size: 35,
                            ),
                            padding: EdgeInsets.all(10),
                            shape: CircleBorder(),
                          ),
                          SizedBox(height: 04,),
                          Text('All Deals',
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
                    child: InkWell(
                      onTap: (){
                        int id=2;
                        Navigator.pushNamed(context, "subcat",arguments: id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                int id=2;
                                Navigator.pushNamed(context, "subcat",arguments: id);

                              },
                              color: Color(0xff36845B),
                              textColor: Colors.white,
                              child: Icon(
                                MyFlutterAppIcon.iconnn,
                                size: 35,

                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Health & Beauty',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        int id=3;
                        Navigator.pushNamed(context, "subcat",arguments: id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                int id=3;
                                Navigator.pushNamed(context, "subcat",arguments: id);
                              },
                              color: Color(0xffFF993D),
                              textColor: Colors.white,
                              child: Icon(
                                MyFlutterAppIcon.movie,
                                size: 35,
                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Lifestyle',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        int id=4;
                        Navigator.pushNamed(context, "subcat",arguments: id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                int id=4;
                                Navigator.pushNamed(context, "subcat",arguments: id);
                              },
                              color: Color(0xff629CFF),
                              textColor: Colors.white,
                              child: Center(
                                child: Icon(
                                  MyFlutterAppIcon.mobile,
                                  size: 35,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Tech',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize:12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        int id=1;
                        Navigator.pushNamed(context, "subcat",arguments: id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                int id=1;
                                Navigator.pushNamed(context, "subcat",arguments: id);
                              },
                              color: Color(0xffCF1E43),
                              textColor: Colors.white,
                              child: Center(
                                child: Icon(
                                  MyFlutterAppIcon.shirt,
                                  size: 35,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 04,),
                            Text('Fashion',
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 12,

                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    )
                  ),


                ],
              ),Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Top Deals',
                  style: TextStyle(
                    color: Color(0xff1D262C),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 180,

                  child: FutureBuilder<Fetchbrandsfromsub>(
                    future: fashionpsot, // a Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<Fetchbrandsfromsub> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none: return new Text('Press button to start');
                        case ConnectionState.waiting: return Loader();
                        default:
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          else
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.response.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return horizentalitem(snapshot.data,index);
                              },
                            );
                      }
                    },
                  )
                ),
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
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    height: 280,
                    child: FutureBuilder<FetchHomeDeals>(
                      future: fetch_home_deals, // a Future<String> or null
                      builder: (BuildContext context, AsyncSnapshot<FetchHomeDeals> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none: return new Text('Press button to start');
                          case ConnectionState.waiting: return Loader();
                          default:
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');
                            else
                              return ListView.builder(
                                itemCount: snapshot.data.response.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return list(snapshot.data,index);
                                },
                              );
                        }
                      },
                    )
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
  Widget list(FetchHomeDeals obj,int index){
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
                        flex: 9,
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
                                    NetworkImage(obj.response[index].brandImageName),
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
                                      child: Text(obj.response[index].tagLine,
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

                                Text('Deduction',
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

                                  ],
                                ),

                              ],
                            ),
                          )
                      ),
                      Expanded(
                        flex: 12,
                        child:   Container(
                          height: 25,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Color(0xff36845B),)),
                            onPressed: () {
                              Single_Data_Sender objj=new Single_Data_Sender(obj.response[index].tagLine, obj.response[index].linkOrCouponValue,obj.response[index].description, obj.response[index].brandImageName);
                              Navigator.pushNamed(context, "viewsingle",arguments: objj);
                            },
                            color: Color(0xff36845B),
                            textColor:Colors.white,
                            child: Text("Get Now".toUpperCase(),
                                style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      )

                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget horizentalitem(Fetchbrandsfromsub obj,int index){
    return Padding(
      padding: const EdgeInsets.only(left: 05,right: 05,top: 05),
      child: Container(
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
              padding: const EdgeInsets.only(left: 10,right: 10,top: 05,bottom: 15),
              child: Column(
                children: [

                  Container(
                    height: 75,
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius:28.0,
                        backgroundImage:
                        NetworkImage(obj.response[index].brandImageName),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(obj.response[index].brandName,
                    style: TextStyle(
                      color: Color(0xff1D262C),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,),
                  Text(obj.response[index].brandTagLine,
                    style: TextStyle(
                      color: Color(0xff1D262C),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 5,),

                  Container(
                    height: 25,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Color(0xff36845B),)),
                      onPressed: () {
                       Single_Data_Sender objj=new Single_Data_Sender("", obj.response[index].brandAutoId,"", obj.response[index].brandImageName);

                      Navigator.pushNamed(context, "viewsinglebrand",arguments: objj);
                      },
                      color: Color(0xff36845B),
                      textColor:Colors.white,
                      child: Text("Get Now".toUpperCase(),
                          style: TextStyle(fontSize: 13)),
                    ),
                  )

                ],
              )
          ),
        ),
      ),
    );
  }
}
