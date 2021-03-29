import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:register/models/image.dart';
import 'package:register/repositories/api/image.dart';
import 'package:rxdart/rxdart.dart';

part 'display_event.dart';
part 'display_state.dart';

class DisplayBloc extends Bloc<DisplayEvent, DisplayState> {

  final ImageRepository repository;

  DisplayBloc({ImageRepository repository})
      : assert(repository != null),
        repository = repository,
        super(DisplayInitial());

  @override
  Stream<Transition<DisplayEvent, DisplayState>> transformEvents(
      Stream<DisplayEvent> events,
      TransitionFunction<DisplayEvent, DisplayState> transitionFn,
      ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<DisplayState> mapEventToState(
    DisplayEvent event,
  ) async* {
    final random = Random();
    List<String> studentIDs = ['371', '372', '373'];
    final currentState = state;
    if (event is DisplayFetch) {
      try {
        if (currentState is DisplayInitial) {
          final response = await repository.getDownload(userID: studentIDs[random.nextInt(2)]);
          yield DisplayFetchedSuccess(path: ImageModel.fromJson(response).data,);
          return;
        }
        if (currentState is DisplayFetchedSuccess) {
          final response = await repository.getDownload(userID: studentIDs[random.nextInt(2)]);
          yield DisplayFetchedSuccess(path: ImageModel.fromJson(response).data,);
        }
      } on NetworkException {
        yield DisplayFetchedFailed();
      }
    }
  }

}

