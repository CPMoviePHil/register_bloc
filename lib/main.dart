import 'package:flutter/material.dart';
import 'app.dart';
import 'package:bloc/bloc.dart';
import 'package:register/blocs/observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

