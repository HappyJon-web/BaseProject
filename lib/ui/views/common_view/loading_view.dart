import 'package:baseproject/ui/ui_helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingWidget() {
  return Container(
    color: Colors.white,
    alignment: Alignment.center,
    child: Container(
        width: 20,
        height: 20,
        child: SpinKitDualRing(
          color: primaryColor,
          size: 24.0,
          lineWidth: 2,
        )),
  );
}
