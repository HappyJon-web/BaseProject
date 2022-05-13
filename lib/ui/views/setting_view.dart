import 'package:baseproject/core/viewmodels/logout_viewmodel.dart';
import 'package:baseproject/login.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class HomeSettingsView extends StatefulWidget {
  const HomeSettingsView({Key key}) : super(key: key);

  @override
  State<HomeSettingsView> createState() => _HomeSettingsView();
}

class _HomeSettingsView extends State<HomeSettingsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LogoutViewModel>(
        onModelReady: (model) async {},
        builder: (context, model, child) => MaterialApp(
            home: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        height: 50.0,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              //                    <--- top side
                              color: Color.fromARGB(255, 105, 105, 105),
                              width: 1.0,
                            ),
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.production_quantity_limits,
                                  color: Color.fromARGB(255, 255, 70, 57),
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Products",
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        height: 50.0,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 105, 105, 105),
                              width: 1.0,
                            ),
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.print,
                                  color: Color.fromARGB(255, 255, 70, 57),
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Printer",
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        height: 50.0,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 105, 105, 105),
                              width: 1.0,
                            ),
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.document_scanner,
                                  color: Color.fromARGB(255, 255, 70, 57),
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Reports",
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        height: 50.0,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 105, 105, 105),
                              width: 1.0,
                            ),
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.language,
                                  color: Color.fromARGB(255, 255, 70, 57),
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Language",
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        model.logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        height: 50.0,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 105, 105, 105),
                              width: 1.0,
                            ),
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 255, 70, 57),
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Logout",
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                )))));
  }
}
