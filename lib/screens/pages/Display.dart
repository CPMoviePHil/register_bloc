import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/blocs/display/display_bloc.dart';
import 'package:register/repositories/api/image.dart';
import 'package:register/utils/screens/appNetworkImage.dart';
import 'package:register/utils/screens/screensUtils.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayBloc(repository: ImageRepository(),),
      child: DisplayPage(),
    );
  }
}

class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<DisplayBloc, DisplayState>(
                builder: (context, state) {
                  if (state is DisplayInitial) {
                    return CircularProgressIndicator();
                  }
                  if (state is DisplayFetchedFailed) {
                    return Text("Network error!");
                  }
                  if (state is DisplayFetchedSuccess) {
                    return Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        //color: Color.fromRGBO(156, 163, 173, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: AppNetworkImage(
                        path: state.path,
                      ),
                    );
                  }
                  return Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(156, 163, 173, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  );
                },
              ),
              BlocBuilder<DisplayBloc, DisplayState>(
                builder: (context, state) {
                  return DisplayActions();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayActions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: actions(
        displayBloc: BlocProvider.of<DisplayBloc>(context),
      ),
    );
  }

  Widget actions({
    DisplayBloc displayBloc,
  }) {

    final DisplayState currentState = displayBloc.state;

    if (currentState is DisplayInitial) {
      return AppElevatedButton(
        buttonText: "Show Image!",
        onPressed: () {
          displayBloc.add(DisplayFetch());
        },
        onLongPress: null,
      );
    } else {
      return AppElevatedButton(
        buttonText: "Refresh!",
        onPressed: () {
          displayBloc.add(DisplayFetch());
        },
        onLongPress: null,
      );
    }
  }
}

