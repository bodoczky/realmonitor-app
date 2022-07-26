import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(BlocProvider(
      create: (context) => NavigationBloc(),
      child: const MyApp(),
    ));
  });
}
