import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingatlan_figyelo_teszt/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}
