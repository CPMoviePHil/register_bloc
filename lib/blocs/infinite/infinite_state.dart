part of 'infinite_bloc.dart';

abstract class InfiniteState extends Equatable {
  const InfiniteState();
  @override
  List<Object> get props => [];
}

class InfiniteInitial extends InfiniteState {}

class InfiniteSuccess extends InfiniteState {
  final PostData data;
  final bool hasReachedLimit;

  const InfiniteSuccess({
    this.data,
    this.hasReachedLimit,
  });

  InfiniteSuccess copyWith({
    List<PostData> data,
    bool hasReachedLimit,
  }) {
    return InfiniteSuccess(
      data: data??this.data,
      hasReachedLimit: hasReachedLimit ?? this.hasReachedLimit,
    );
  }

  @override
  List<Object> get props => [data, hasReachedLimit];
}

class InfiniteFailure extends InfiniteState {}
