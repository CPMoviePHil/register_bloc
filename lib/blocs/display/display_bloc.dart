import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'display_event.dart';
part 'display_state.dart';

class DisplayBloc extends Bloc<DisplayEvent, DisplayState> {
  DisplayBloc() : super(DisplayInitial());

  @override
  Stream<DisplayState> mapEventToState(
    DisplayEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
