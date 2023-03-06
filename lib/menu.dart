import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/pages/Home_page.dart';

import 'pages/profile.dart';
import 'pages/quotes.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  List pages = [
    Home_page(),
    Quotes(),
    profile(),
  ];
  int current = 0;
  void onTap(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: current,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.3),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Blogs", icon: Icon(Icons.format_quote_sharp)),
            BottomNavigationBarItem(
                label: "MyProfile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
