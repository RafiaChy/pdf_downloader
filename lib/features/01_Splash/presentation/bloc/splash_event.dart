part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable{
  const SplashEvent();
  @override

  List<Object?> get props => [];
}

class BringSplashScreen extends SplashEvent{
  final BuildContext context;
  const BringSplashScreen({required this.context});
  @override

  List<Object?> get props => [context];
}