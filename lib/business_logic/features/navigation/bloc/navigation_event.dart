part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationEventPop extends NavigationEvent {}

class NavigationEventAdd extends NavigationEvent {
  final String page;
  const NavigationEventAdd(this.page);
  @override
  List<Object> get props => [page];
}
