part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable{
  const HomeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}
class HomeDownloading extends HomeState {}
class HomeDownloaded extends HomeState {
  final String filePathExtracted;
  const HomeDownloaded({required this.filePathExtracted});
  @override

  List<Object?> get props => [filePathExtracted];
}
class HomeDownError extends HomeState {
  final String errorMessage;
  const HomeDownError({required this.errorMessage});
  @override

  List<Object?> get props => [errorMessage];
}
