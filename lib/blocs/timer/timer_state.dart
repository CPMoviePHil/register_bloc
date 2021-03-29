part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState({this.duration});

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  final int duration;

  TimerInitial({this.duration}) : super(duration: duration);
}

class TimerRunInProgress extends TimerState {
  final int duration;

  TimerRunInProgress({this.duration}): super(duration: duration);
}

class TimerRunPaused extends TimerState {
  final int duration;

  TimerRunPaused({this.duration}) : super(duration: duration);
}

class TimerRunCompleted extends TimerState {
  TimerRunCompleted(): super(duration: 0);
}

