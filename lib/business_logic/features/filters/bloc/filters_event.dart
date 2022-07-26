part of 'filters_bloc.dart';

@immutable
abstract class FiltersEvent {
  const FiltersEvent();

  List<Object> get props => [];
}

class LoadFiltersEvent extends FiltersEvent {}
