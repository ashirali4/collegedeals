import 'package:collegedeals/Dashboard_Pages/Favourite.dart';
import 'package:flutter/material.dart';

import 'Dashboard_Pages/Main_Dashboard.dart';
import 'Dashboard_Pages/Profile.dart';
import 'Dashboard_Pages/Settings.dart';
import 'Dashboard_Pages/blog.dart';
import 'SVGicons/SVGiconclass.dart';


class home_page extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<home_page> {

  int _currentIndex = 0;

  final tabs= [
    Dash_Mian(),
    //Favourite_Screen(),
    Blog_View(),
    Setting_Dashboard(),
    Profile_Screen(),


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
              icon: Icon(Icons.home_outlined,size: 25,),
              title: Text("Dashboard"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
              backgroundColor: Color(0xffFFFFFF),
            ),

            // BottomNavigationBarItem(
            //   // icon: Image.asset('assets/gab.png'),
            //   icon: Icon(MyFlutterAppIcon.favorites,size: 20,),
            //   title:Text("Invoices"
            //     ,style: TextStyle(
            //         fontFamily: "OpenSans",
            //         fontSize: 12,
            //         color: Color(0xFFBBBBBB)
            //     ),),
            // ),

            BottomNavigationBarItem(
              // icon: Image.asset('assets/gab.png'),
              icon: Icon(Icons.featured_play_list_outlined,size: 23,),
              title:Text("Clients"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
            ),

            BottomNavigationBarItem(
              // icon: Image.asset('assets/gab.png'),
              icon: Icon(Icons.blur_circular_outlined,size: 25,),
              title: Text("Items"
                ,style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xFFBBBBBB)
                ),),
            ),
            BottomNavigationBarItem(
              // icon: Image.asset('assets/gab.png'),
              icon: Icon(Icons.account_circle_outlined,size: 25,),
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
