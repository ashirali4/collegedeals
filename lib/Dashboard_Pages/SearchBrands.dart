import 'package:collegedeals/APIModels/Home_DEALS_model.dart';
import 'package:collegedeals/APIModels/SearchAPI.dart';
import 'package:collegedeals/APIModels/Single_Data_Sender.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../APIcalls.dart';
class Search_Brands extends StatefulWidget {
  String serachq;
  @override
  _Search_BrandsState createState() => _Search_BrandsState();
  Search_Brands(this.serachq);
}

class _Search_BrandsState extends State<Search_Brands> {
  MyApi apiclass=new MyApi();
  Future<SearchBrands> fetch_home_deals;

  @override
  Widget build(BuildContext context) {
    fetch_home_deals=apiclass.searchbrands(widget.serachq);
    return Scaffold(
      appBar: AppBar(
        backgroundColor : Color(0xff36845B),
        title: Text("Search : "+widget.serachq),
      ),
      body: Container(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text('Search Results',
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
                   child: FutureBuilder<SearchBrands>(
                     future: fetch_home_deals, // a Future<String> or null
                     builder: (BuildContext context, AsyncSnapshot<SearchBrands> snapshot) {
                       switch (snapshot.connectionState) {
                         case ConnectionState.none: return new Text('Press button to start');
                         case ConnectionState.waiting: return Loader();
                         default:
                           if (snapshot.hasError)
                             return new Text('Error: ${snapshot.error}');
                           else
                             {
                               if(snapshot.data.response!=null){
                                 return ListView.builder(
                                   itemCount: snapshot.data.response.length,
                                   itemBuilder: (BuildContext ctxt, int index) {
                                     return list(snapshot.data,index);
                                   },
                                 );
                               }
                               else{
                                 return Center(
                                   child: Container(
                                     child: Text("No Search Results Found",
                                       style: TextStyle(
                                         color: Color(0xff1D262C),
                                         fontSize: 17,
                                         fontWeight: FontWeight.w500,
                                         fontFamily: 'Poppins',
                                       ),
                                       textAlign: TextAlign.start,),
                                   ),
                                 );
                               }
                             }
                       }
                     },
                   )
               ),
             ),
           ],
         )
      ),
    );
  }
  Widget list(SearchBrands obj,int index){
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
                                    NetworkImage('https://collegedeals.in/site_assets/brands_imgs/'+obj.response[index].image),
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
                                      child: Text(obj.response[index].name,
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

                                Text(obj.response[index].tagLine,
                                  style: TextStyle(
                                    color: Color(0xff1D262C).withOpacity(.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),),
                                SizedBox(height: 03,),


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
                              Single_Data_Sender objj=new Single_Data_Sender("", obj.response[index].autoId,"", obj.response[index].image);
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

}
