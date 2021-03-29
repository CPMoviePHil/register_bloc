import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'file:///D:/Project/register/lib/utils/timer.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {

  static const int _duration = 60;
  StreamSubscription<int> _subscription;
  TimerStream _ticker;

  TimerBloc({TimerStream ticker})
      : assert(ticker != null), _ticker = ticker, super(TimerInitial(duration: _duration));

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerStarted) {
      yield* _mapEventToTimerInitial(event);
    }
    if (event is TimerPaused) {
      yield* _mapEventToTimerPaused(event);
    }
    if (event is TimerResumed) {
      yield* _mapEventToTimerResumed(event);
    }
    if (event is TimerReset) {
      yield* _mapEventToTimerReset(event);
    }
    if (event is TimerTicked) {
      yield* _mapEventToTimerTicked(event);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Stream _mapEventToTimerInitial(TimerStarted event) async* {
    yield TimerRunInProgress(
      duration: event.duration,
    );
    _subscription?.cancel();
    _subscription = _ticker.ticker(_duration).listen((event) {
      add(TimerTicked(duration: event));
    });
  }

  Stream _mapEventToTimerTicked(TimerTicked event) async* {
    yield event.duration == 0
        ? TimerRunCompleted()
        : TimerRunInProgress(duration: event.duration);
  }

  Stream _mapEventToTimerPaused(TimerPaused event) async* {
    _subscription?.cancel();
    yield TimerRunPaused(duration: state.duration);
  }

  Stream<TimerState> _mapEventToTimerResumed(TimerResumed resume) async* {
    _subscription?.resume();
    yield TimerRunInProgress(duration: state.duration);
  }

  Stream<TimerState> _mapEventToTimerReset(TimerReset event) async* {
    _subscription?.cancel();
    yield TimerInitial(duration: _duration);
  }
}
