import 'package:flutter/material.dart';
import 'package:register/screens/pages/home.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key}) : super(key: key);

  @override
  _NavigationState createState()=> _NavigationState();

}

class _NavigationState extends State<NavigationScreen>{

  final pageList = [
    Home(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
    );
  }
}