part of 'download_bloc.dart';

@immutable
abstract class DownloadState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DownloadInitial extends DownloadState {}

class DownloadLoaded extends DownloadState {}

class DownloadCompleted extends DownloadState {}

class DownloadError extends DownloadState {}
