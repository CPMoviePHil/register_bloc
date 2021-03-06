part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  final int duration;

  TimerStarted({this.duration});

}

class TimerPaused extends TimerEvent{}

class TimerResumed extends TimerEvent{}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent{
  final int duration;

  const TimerTicked({this.duration});

  @override
  List<Object> get props => [duration];
}