import 'package:baseproject/core/viewmodels/home_viewmodel.dart';
import 'package:baseproject/login.dart';
// import 'package:baseproject/navdrawer.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:baseproject/ui/views/setting_view.dart';
import 'package:baseproject/ui/views/home_order_view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    HomeOrderView(),
    Text(
      'Index 1: History',
    ),
    Text(
      'Index 2: Schedule',
    ),
    HomeSettingsView(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) async {},
        builder: (context, model, child) => Scaffold(
              // drawer: NavDrawer(),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Color.fromARGB(235, 255, 255, 255),
                title: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              body: _children[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                selectedFontSize: 20,
                selectedIconTheme:
                    IconThemeData(color: Colors.redAccent, size: 40),
                selectedItemColor: Colors.redAccent,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

                unselectedIconTheme: IconThemeData(
                  color: Colors.black,
                ),
                unselectedItemColor: Colors.black,

                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant),
                    label: 'Order',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'Schedule',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                currentIndex: _selectedIndex, //New
                onTap: _onItemTapped,
              ),
            ));
  }
}
