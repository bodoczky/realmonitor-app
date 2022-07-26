part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationPopped extends NavigationState {}

class NavigationDone extends NavigationState {
  final String page;
  const NavigationDone(this.page);
  @override
  List<Object> get props => [page];
}
