import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationPopped()) {
    on<NavigationEventAdd>((event, emit) => emit(NavigationDone(event.page)));
    on<NavigationEventPop>((event, emit) => emit(NavigationPopped()));
  }
}
