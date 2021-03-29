import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:register/models/image.dart';
import 'package:register/repositories/api/image.dart';

part 'display_event.dart';
part 'display_state.dart';

class DisplayBloc extends Bloc<DisplayEvent, DisplayState> {

  final ImageRepository repository;

  DisplayBloc({ImageRepository repository})
      : assert(repository != null),
        repository = repository,
        super(DisplayInitial());

  @override
  Stream<DisplayState> mapEventToState(
    DisplayEvent event,
  ) async* {
    if (event is DisplayFetch) {
      try {
        if (state is DisplayInitial) {
          final response = await repository.getDownload();
          yield DisplayFetchedSuccess(path: ImageModel.fromJson(response).data,);
        }
        if (state is DisplayFetchedSuccess) {
          final response = await repository.getDownload();
          yield DisplayFetchedSuccess(path: ImageModel.fromJson(response).data,);
        }
      } on NetworkException {
        yield DisplayFetchedFailed();
      }
    }
  }

}

