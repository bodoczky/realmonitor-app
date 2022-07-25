import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/filters/repository/filters_repository.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/dashboard/dashboard.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => FiltersRepository(),
      child: MaterialApp(
        title: 'Ingatlanfigyelő',
        theme: LightTheme().themeData,
        darkTheme: DarkTheme().themeData,
        home: const Dashboard(),
      ),
    );
  }
}
