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
}

class DisplayFetchedFailed extends DisplayState {}