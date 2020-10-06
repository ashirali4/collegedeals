import 'package:flutter/material.dart';

import 'Dashboard_Pages/Main_Dashboard.dart';
import 'SVGicons/SVGiconclass.dart';


class home_page extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<home_page> {

  int _currentIndex = 0;

  final tabs= [
    Dash_Mian(),
    Dash_Mian(),
    Dash_Mian(),
    Dash_Mian(),
  ];

  final List<int> colorlist=[0xff7ED321,0xFF546E7A,
    0xFFF59210,
    0xFF945291,
    0xFF938470,
    0xFF0073C6,
    0xFF848484];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color(0xff36845B),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 20,


          showSelectedLabels: false,
          showUnselectedLabels: false,

          currentIndex: _currentIndex,

          items: [
            BottomNavigationBarItem(
              //icon: Image.asset('assets/gab.png'),
              icon: Icon(MyFlutterAppIcon.home,size: 20,),
              title: Text("Dashboard"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
              backgroundColor: Color(0xffFFFFFF),
            ),

            BottomNavigationBarItem(
              // icon: Image.asset('assets/gab.png'),
              icon: Icon(MyFlutterAppIcon.favorites,size: 20,),
              title:Text("Invoices"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
            ),

            BottomNavigationBarItem(
              // icon: Image.asset('assets/gab.png'),
              icon: Icon(MyFlutterAppIcon.file,size: 20,),
              title:Text("Clients"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
            ),

            BottomNavigationBarItem(
              // icon: Image.asset('assets/gab.png'),
              icon: Icon(MyFlutterAppIcon.settings,size: 20,),
              title: Text("Items"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
            ),

          ],
          onTap: (index){
            setState(() {
              _currentIndex=index;

            });
          },
        ),
      ),
    );
  }


}
