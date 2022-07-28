import 'package:flutter/material.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/dashboard/dashboard_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/favorites/favorites_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/new_ideas/new_ideas_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/market_info/market_info_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/monetary_extras/monetary_extras_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/results/results_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/settings/data_processing/data_processing_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/settings/profile/profile_screen.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/settings/settings_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/data_processing':
        return MaterialPageRoute(
            builder: (BuildContext context) => const DataProcessingScreen());
      case '/results':
        return MaterialPageRoute(builder: (BuildContext context) {
          ResultsScreenArgModel resultArguments = args as ResultsScreenArgModel;

          return ResultsScreen(title: resultArguments.title);
        });
      case '/favorites':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const FavoritesScreen();
        });
      case '/market_info':
        return MaterialPageRoute(builder: (BuildContext context) {
          return MarketInfoScreen();
        });
      case '/monetary_extras':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const MonetaryExtrasScreen();
        });
      case '/settings':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SettingsScreen();
        });
      case '/profile':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const ProfileScreen();
        });
      case '/new_ideas':
        return MaterialPageRoute(builder: (BuildContext context) {
          NewIdeasScreenArgModel newIdeasScreenArgModel =
              args as NewIdeasScreenArgModel;

          return NewIdeasScreen(
            model: newIdeasScreenArgModel.model,
          );
        });
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Dashboard());
    }
  }
}
