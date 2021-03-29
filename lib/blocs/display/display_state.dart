part of 'display_bloc.dart';

@immutable
abstract class DisplayState extends Equatable{

  DisplayState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DisplayInitial extends DisplayState {}

class DisplayFetchedSuccess extends DisplayState {
  final String path;

  DisplayFetchedSuccess({this.path});

  DisplayFetchedSuccess copyWith({
    String path,
  }) {
    return DisplayFetchedSuccess(
      path: path ?? this.path,
    );
  }

  @override
  List<Object> get props => [path];
}

class DisplayFetchedFailed extends DisplayState {}