import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  CustomAppBar({this.height = kToolbarHeight});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 40,left: 30,right: 30),
        child: Image.asset("assets/collegedealslogo.png"),
      ),
    );
  }
}