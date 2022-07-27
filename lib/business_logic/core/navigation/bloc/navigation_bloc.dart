import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationPopped()) {
    on<NavigationEventAdd>(
        (event, emit) => emit(NavigationDone(event.screen, event.args)));
    on<NavigationEventPop>((event, emit) => emit(NavigationPopped()));
  }
}
