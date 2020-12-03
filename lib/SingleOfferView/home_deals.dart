import 'package:collegedeals/APIModels/Fetch_Brands_From_Subcat.dart';
import 'package:collegedeals/APIModels/Home_DEALS_model.dart';
import 'package:collegedeals/APIModels/Single_Data_Sender.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/material.dart';

import '../APIcalls.dart';
class Home_deals extends StatefulWidget {
  @override
  _Home_dealsState createState() => _Home_dealsState();
}

class _Home_dealsState extends State<Home_deals> {
  Future<FetchHomeDeals> fetch_home_deals;
  Future<Fetchbrandsfromsub> fashionpsot;
  MyApi apiclass=new MyApi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_home_deals=apiclass.fetchalldeals();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff36845B),
        title: Text("All Deals"),
      ),
      body: Container(
        child: Column(
          children: [



            Expanded(child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  height: 300,
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
                            return GridView.builder(
                              shrinkWrap: false,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.1),
                              itemBuilder: (_, index) => Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                                  child: InkWell(

                                      child: GridViewElement(snapshot.data,index))
                              ),
                              itemCount: snapshot.data.response.length,
                            );
                      }
                    },
                  )
              ),
            ),flex: 10,)
          ],
        ),
      ),
    );
  }







  Widget GridViewElement(FetchHomeDeals obj,int index){
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child:Container(
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
            padding: EdgeInsets.only(
              left: 2.0, right: 2.0, ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(

                ),
                child:  Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 11,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(fit: BoxFit.contain,
                                image: obj.response[index].brandImageName==null ?NetworkImage(""): NetworkImage(obj.response[index].brandImageName),

                              )
                          ),

                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Text(obj.response[index].tagLine,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff1D262C),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.start,),

                          ],
                        )
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 15,
                          width: MediaQuery.of(context).size.width,
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
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }

}
