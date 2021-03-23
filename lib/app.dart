import 'package:flutter/material.dart';
import 'package:register/screens/screens.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationScreen(),
    );
  }
}