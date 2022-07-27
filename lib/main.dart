import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/localization/bloc/localization_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/repositories/preferences/preferences_repository_impl.dart';
import 'package:ingatlan_figyelo_teszt/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    final preferencesRepository = PreferencesRepositoryImpl();
    final localizationBloc = LocalizationBloc(
      preferencesRepository: preferencesRepository,
      initialLocale: await preferencesRepository.locale,
    );
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => localizationBloc,
        ),
      ],
      child: const MyApp(),
    ));
  });
}
