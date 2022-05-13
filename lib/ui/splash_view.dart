import 'package:baseproject/core/viewmodels/splash_viewmodel.dart';
import 'package:baseproject/login.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:baseproject/ui/views/home.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) async {
        LoginCheck loginCheck = await model.loginCheck();
        await Future.delayed(Duration(milliseconds: 500));
        if (loginCheck == LoginCheck.Home) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MyHomePage(title: "PenangOne");
              },
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );
        }
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: "APPICON",
                  child: Container(
                      padding: EdgeInsets.all(16),
                      height: 255,
                      width: MediaQuery.of(context).size.width,
                      // padding: EdgeInsets.all(16),
                      child: Center(
                        child: Image.asset(
                          "assets/splash.jpeg",
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
