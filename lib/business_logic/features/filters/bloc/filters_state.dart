part of 'filters_bloc.dart';

@immutable
abstract class FiltersState {}

class FiltersInitial extends FiltersState {}

class FiltersLoadingState extends FiltersState {}

class FiltersErrorState extends FiltersState {
  final String message;
  FiltersErrorState(this.message);
}

class FiltersLoadedState extends FiltersState {
  final FilterModel model;
  FiltersLoadedState(this.model);
}
