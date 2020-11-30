import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/APIModels/Fetch_Brands_From_Subcat.dart';
import 'package:collegedeals/APIModels/Home_DEALS_model.dart';
import 'package:collegedeals/APIModels/Homepage_FAashion_model.dart';
import 'package:collegedeals/APIModels/Single_Data_Sender.dart';
import 'package:collegedeals/APIModels/SubCatFetch.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/material.dart';

class Subcat_Fetch extends StatefulWidget {
  int id;
  @override
  _SubState createState() => _SubState();
  Subcat_Fetch(this.id);
}

class _SubState extends State<Subcat_Fetch> {
  Future<Fetchbrandsfromsub> fetchsubcatbrands;
  Future<FashionPost> fashionpsot;
  Future<List<Subcatfetchapi>> subcat;
  List<Widget> tabnames=new List<Widget>();
  List<Widget> tabviews=new List<Widget>();

  MyApi apiclass=new MyApi();

  @override
  Widget build(BuildContext context) {
    fashionpsot=apiclass.topfashionposts();
    subcat=apiclass.subcatlist(widget.id);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                child:Column(
                  children: [
                    SizedBox(height: 40,),
                    Center(
                      child: Container(

                        width: 170,
                        height: 50,
                        child: Image.asset("assets/collegedealslogo.png"
                        ),
                      ),
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
                  ],
                )
              ),

              Expanded(
                child: new FutureBuilder<List<Subcatfetchapi>>(
                  future: subcat, // a Future<String> or null
                  builder: (BuildContext context, AsyncSnapshot<List<Subcatfetchapi>>snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none: return new Text('Press button to start');
                      case ConnectionState.waiting: return Center(child: Loader());
                      default:
                        if (snapshot.hasError)
                          return new Text('Error: ${snapshot.error}');
                        else
                          {
                            int lenght=snapshot.data.length;
                            for(int a=0;a<lenght;a++){
                              tabnames.add( Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(snapshot.data[a].name,
                                  style: TextStyle(
                                      color: Colors.black
                                  ),),
                              ),);
                              fetchsubcatbrands=apiclass.subcatbrands(snapshot.data[a].autoId);
                              tabviews.add( Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    height: 280,
                                    child: FutureBuilder<Fetchbrandsfromsub>(
                                      future: fetchsubcatbrands, // a Future<String> or null
                                      builder: (BuildContext context, AsyncSnapshot<Fetchbrandsfromsub> snapshot) {
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
                              ),);


                            }
                            return DefaultTabController(
                              length: lenght,
                              child: new Scaffold(
                                appBar: new PreferredSize(
                                  preferredSize: Size.fromHeight(kToolbarHeight),
                                  child: new Container(

                                    child: new SafeArea(
                                      child: Column(
                                        children: <Widget>[
                                          new TabBar(
                                            indicatorColor: Color(0xff36845B),
                                            isScrollable: true,
                                            tabs: tabnames,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                body: new TabBarView(
                                  children:tabviews,
                                ),
                              ),
                            );

                          }
                    }
                  },
                )
              ),



//                Padding(
//                  padding: const EdgeInsets.all(5.0),
//                  child: Container(
//                      height: 280,
//                      child: FutureBuilder<FetchHomeDeals>(
//                        future: fetch_home_deals, // a Future<String> or null
//                        builder: (BuildContext context, AsyncSnapshot<FetchHomeDeals> snapshot) {
//                          switch (snapshot.connectionState) {
//                            case ConnectionState.none: return new Text('Press button to start');
//                            case ConnectionState.waiting: return Loader();
//                            default:
//                              if (snapshot.hasError)
//                                return new Text('Error: ${snapshot.error}');
//                              else
//                                return ListView.builder(
//                                  itemCount: snapshot.data.response.length,
//                                  itemBuilder: (BuildContext ctxt, int index) {
//                                    return list(snapshot.data,index);
//                                  },
//                                );
//                          }
//                        },
//                      )
//                  ),
//                ),

            ],
          ),

        ),
      ),
    );
  }
  Widget list(Fetchbrandsfromsub obj,int index){
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
                                      child: Text(obj.response[index].brandName,
                                        style: TextStyle(
                                          color: Color(0xff1D262C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        ),
                                        textAlign: TextAlign.start,),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 03,),

//                                Text('Deduction',
//                                  style: TextStyle(
//                                    color: Color(0xff1D262C).withOpacity(.5),
//                                    fontSize: 12,
//                                    fontWeight: FontWeight.w400,
//                                    fontFamily: 'Poppins',
//                                  ),),
//                                SizedBox(height: 03,),
//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                  children: [
//                                    ClipRRect(
//                                      borderRadius: BorderRadius.circular(40.0),
//                                      child: Container(
//                                        height: 25.0,
//                                        width: 60,
//                                        color: Color(0xffFFDC68).withOpacity(.3),
//                                        child: Center(
//                                          child: Row(
//                                            mainAxisAlignment: MainAxisAlignment.center,
//                                            children: [
//                                              Icon(Icons.star
//                                                ,size: 18,color: Color(0xffFFDC68),),
//                                              Text(' 4.5',
//                                                style: TextStyle(
//                                                  color: Color(0xff1D262C).withOpacity(.5),
//                                                  fontSize: 10,
//                                                  fontWeight: FontWeight.w400,
//                                                  fontFamily: 'Poppins',
//                                                ),),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//
//                                  ],
//                                ),

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
                              Single_Data_Sender objj=new Single_Data_Sender("", obj.response[index].brandAutoId,"", obj.response[index].brandImageName);
                              Navigator.pushNamed(context, "viewsinglebrand",arguments: objj);
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
  Widget horizentalitem(FashionPost obj,int index){
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
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
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
                        NetworkImage('https://collegedeals.in/site_assets/brands_imgs/'+obj.response[index].image),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(obj.response[index].tagLine,
                    style: TextStyle(
                      color: Color(0xff1D262C),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 10,),

                  Container(
                    height: 25,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Color(0xff36845B),)),
                      onPressed: () {
                        Single_Data_Sender objj=new Single_Data_Sender(obj.response[index].tagLine, obj.response[index].websiteLink,obj.response[index].description, obj.response[index].image);

                        Navigator.pushNamed(context, "viewsingle",arguments: objj);
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
