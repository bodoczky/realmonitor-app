part of 'filters_bloc.dart';

@immutable
abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

class FiltersInitial extends FiltersState {}

class FiltersLoadingState extends FiltersState {}

class FiltersErrorState extends FiltersState {
  final String message;
  const FiltersErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class FiltersLoadedState extends FiltersState {
  final FilterModel model;
  const FiltersLoadedState(this.model);
  @override
  List<Object> get props => [model];
}
