import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:register/models/models.dart';

part 'infinite_event.dart';
part 'infinite_state.dart';

class InfiniteBloc extends Bloc<InfiniteEvent, InfiniteState> {
  InfiniteBloc() : super(InfiniteInitial());

  @override
  Stream<InfiniteState> mapEventToState(
    InfiniteEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
