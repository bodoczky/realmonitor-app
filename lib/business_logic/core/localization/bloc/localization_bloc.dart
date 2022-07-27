import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ingatlan_figyelo_teszt/repositories/preferences/preferences_repository.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final PreferencesRepository preferencesRepository;

  LocalizationBloc({
    required this.preferencesRepository,
    required Locale initialLocale,
  }) : super(ChangeLocalization(locale: initialLocale)) {
    on<ChangeLocaleEvent>((event, emit) async {
      await preferencesRepository.saveLocale(event.locale);
      emit(ChangeLocalization(locale: event.locale));
      emit(LocalizationReset(locale: event.locale)); //TODO fix this
    });
  }
}
