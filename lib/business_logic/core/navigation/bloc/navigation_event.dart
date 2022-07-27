part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationEventPop extends NavigationEvent {}

class NavigationEventAdd extends NavigationEvent {
  final Screen screen;
  final Object? args;
  const NavigationEventAdd(this.screen, this.args);
  @override
  List<Object> get props => [screen, args ?? {}];
}
