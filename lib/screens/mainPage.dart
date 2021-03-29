import 'package:flutter/material.dart';
import 'package:register/screens/pages/Pages.dart';
import 'package:register/utils/screens/class/BarItem.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({
    Key key,
  }) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();

}

class _NavigationState extends State<NavigationScreen>{

  final pageList = [
    Register(),
    Display(),
    Countdown(),
  ];

  final List<BarItem> barItemList = [
    BarItem(
      icon: Icons.person_add,
      itemText: "Register",
    ),
    BarItem(
      icon: Icons.file_download,
      itemText: "Display",
    ),
    BarItem(
      icon: Icons.timer,
      itemText: "Countdown",
    ),
  ];

  int currentIndex = 0;

  BottomNavigationBarItem barItem({
    IconData icon,
    String itemText,
  }){
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      label: itemText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (currentPageIndex){
          setState(() {
            currentIndex = currentPageIndex;
          });
        },
        items: barItemList.map((e) => barItem(
          icon: e.icon, itemText: e.itemText,),
        ).toList(),
      ),
    );
  }
}