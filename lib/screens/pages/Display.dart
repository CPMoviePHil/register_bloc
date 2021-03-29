import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/blocs/display/display_bloc.dart';
import 'package:register/utils/screens/screensUtils.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayBloc(),
      child: DisplayPage(),
    );
  }
}

class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(156, 163, 173, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              DisplayActions(),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayActions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      buttonText: "Show Image!",
      onPressed: () {

      },
      onLongPress: null,
    );
  }
}

