import 'package:flutter/material.dart';
import 'package:tulearner/layout/Screen/frontpage.dart';
import 'package:tulearner/layout/Screen/secondPage.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectindex = 0;

  List<Widget> navwidget = [
    FrontPage(),
    FeatureMenu(),
  ];
  ontapfunction(int index) {
    if (mounted) {
      setState(() {
        selectindex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navwidget.elementAt(selectindex),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        selectedFontSize: 15,
        onTap: ontapfunction,
        currentIndex: selectindex,
        backgroundColor: Colors.grey[300],
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Menu",
            icon: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
