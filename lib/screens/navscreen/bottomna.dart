import 'package:flutter/material.dart';
import 'package:milkman_application_4/screens/Homepage.dart';
import 'package:milkman_application_4/screens/navscreen/page1.dart';
import 'package:milkman_application_4/screens/navscreen/page3.dart';

import 'calender.dart';

class BottomNavigationB extends StatefulWidget {
  @override
  State<BottomNavigationB> createState() => _BottomNavigationBState();
}

class _BottomNavigationBState extends State<BottomNavigationB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 55,
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_invitation_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_sharp,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image_search_sharp,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
