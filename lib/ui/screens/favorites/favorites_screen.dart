import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/dotted_info_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
          return Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Kedvencek"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: const [
                SizedBox(
                  height: 25,
                ),
                DottedInfoCard(
                  title: "Még nincsenek kedvenceid",
                  bodyText:
                      "Jelölj kedvencként hirdetéseket a jobb felső sarokban lévő szívecskére bökve. Idegyűjtük neked ezeket a kedvenceket.",
                )
              ],
            ),
          ),
        ));
  }
}
