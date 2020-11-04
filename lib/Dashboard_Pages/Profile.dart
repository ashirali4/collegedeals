import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:flutter/material.dart';

class Setting_Dashboard extends StatefulWidget {
  @override
  _Setting_DashboardState createState() => _Setting_DashboardState();
}

class _Setting_DashboardState extends State<Setting_Dashboard> {
  bool value=true;
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
                child: Text('Settings',
                  style: TextStyle(
                    color: Color(0xff1D262C),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,),
              ),


              list(),

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
                  child: Column(
                    children: [
                    //  Listitemsettings("assets/notfication.png","Notifications",swithnotify()),
                    //  Listitemsettings("assets/promo.png","Promotions",pass()),
                     // Listitemsettings("assets/languag.png","Language",pass()),
                    //  Listitemsettings("assets/refer.png","Refer Someone",pass()),
                      Listitemsettings("assets/about.png","About Us",SizedBox(width: 1,)),
                      Listitemsettings("assets/support.png","Support",SizedBox(width: 1,)),
                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget Listitemsettings(String assetimage,String text,Widget name){
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              width: 40,
              child: Image.asset(assetimage),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.start,),
          ),
          Expanded(
            flex: 1,
            child: name,
          )
        ],
      ),
    );
  }
  Widget pass(){
    return Container(
      child: Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.5),size: 15,),
    );
  }
  Widget swithnotify(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 60,
            child: Switch(
              onChanged: (dd){
                setState(() {
                  value=dd;
                });
              },
              value: value,
              activeColor:  Color(0xff36845B),
            )
        ),
      ],
    );
  }
}
