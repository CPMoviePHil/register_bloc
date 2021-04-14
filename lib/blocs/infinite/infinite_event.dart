part of 'infinite_bloc.dart';

abstract class InfiniteEvent extends Equatable {
  const InfiniteEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InfiniteFetch extends InfiniteEvent {}