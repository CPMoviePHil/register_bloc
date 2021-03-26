import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitial());

  @override
  Stream<DownloadState> mapEventToState(
    DownloadEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
