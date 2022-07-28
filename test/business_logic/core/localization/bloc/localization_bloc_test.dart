import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/localization/bloc/localization_bloc.dart';
import 'package:ingatlan_figyelo_teszt/repositories/preferences/preferences_repository.dart';
import 'package:mockito/mockito.dart';

class MockPreferences extends Mock implements PreferencesRepository {
  @override
  Future<void> saveLocale(Locale locale) => super.noSuchMethod(
        Invocation.method(#createAccount, [locale]),
        returnValue: Future<void>.value(),
      );
}

void main() {
  late MockPreferences mockPreferences;
  late Locale locale;

  setUp(() {
    mockPreferences = MockPreferences();
    locale = const Locale("en");
  });

  group('FiltersBloc', () {
    blocTest<LocalizationBloc, LocalizationState>(
      'emit "ChangeLocalization" then "LocalizationReset" state when adding "ChangeLocaleEvent" event ',
      build: () {
        when(mockPreferences.saveLocale(locale))
            .thenAnswer((realInvocation) async => {});
        return LocalizationBloc(
            initialLocale: locale, preferencesRepository: mockPreferences);
      },
      act: (bloc) => bloc.add(ChangeLocaleEvent(locale)),
      expect: () => [
        ChangeLocalization(locale: locale),
        LocalizationReset(locale: locale),
      ],
    );
  });
}
