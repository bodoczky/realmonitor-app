import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/localization/bloc/localization_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/utils/extensions/app_localizations_context.dart';
import 'package:ingatlan_figyelo_teszt/repositories/filters/filters_repository_impl.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/routing/route_generator.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => FiltersRepositoryImpl(),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            theme: LightTheme().themeData,
            darkTheme: DarkTheme().themeData,
            onGenerateRoute: RouteGenerator.generateRoute,
            onGenerateTitle: (context) => context.loc!.applicationTitle,
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('hu', ''),
              //Locale('es', ''), // Coming soon™
            ],
          );
        },
      ),
    );
  }
}
