import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/blocs/timer/timer_bloc.dart';
import 'package:register/utils/ticker.dart';

class Countdown extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: TimerStream()),
      child: CountdownPage(),
    );
  }
}

class CountdownPage extends StatelessWidget{
  static const TextStyle countdownTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state){
              final String minutesStr = ((state.duration / 60) % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              final String secondsStr =
              (state.duration % 60).floor().toString().padLeft(2, '0');
              return Text(
                '$minutesStr:$secondsStr',
                style: CountdownPage.countdownTextStyle,
              );
            },
          ),
        ),
        BlocBuilder<TimerBloc, TimerState>(
          buildWhen: (previousState, state) =>
          state.runtimeType != previousState.runtimeType,
          builder: (context, state) => Actions(),
        ),
      ],
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    TimerBloc timerBloc,
  }) {
    final TimerState currentState = timerBloc.state;
    if (currentState is TimerInitial) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              timerBloc.add(TimerStarted(duration: currentState.duration)),
        ),
      ];
    }
    if (currentState is TimerRunInProgress) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.add(TimerPaused()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    if (currentState is TimerRunPaused) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(TimerResumed()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    if (currentState is TimerRunCompleted) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    return [];
  }
}