part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationPopped extends NavigationState {}

class NavigationDone extends NavigationState {
  final Screen screen;
  final Object? args;
  const NavigationDone(this.screen, this.args);
  @override
  List<Object> get props => [screen, args ?? {}];
}
