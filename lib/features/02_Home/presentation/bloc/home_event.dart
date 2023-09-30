part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class DownloadPdf extends HomeEvent{
  final String url;
  const DownloadPdf({required this.url});
  @override
  List<Object?> get props => [url];
}