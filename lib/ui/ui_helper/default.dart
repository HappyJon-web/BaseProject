import 'package:baseproject/ui/ui_helper/color.dart';
import 'package:flutter/material.dart';

Widget defaultPlaceHolder() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey]),
        borderRadius: BorderRadius.circular(8)),
  );
}

Widget loadingWidget() {
  return Container(
    color: Colors.transparent,
    alignment: Alignment.center,
    child: Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),
          strokeWidth: 2,
        )),
  );
}
