import 'package:flutter/material.dart';

Widget Loader(){
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Container(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff36845B),),
        )),

    ],
    )
  );

}