import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/dotted_info_card.dart';

class DataProcessingScreen extends StatelessWidget {
  const DataProcessingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
          return Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Adatkezelés"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const DottedInfoCard(
                  title: "Adatkezelési jogosultságaid beállítása",
                  bodyText:
                      "Hozzájárulásod lehetővé teszi, hogy tanácsadást kapj a K&H Bank hitelszakértőjétől lakáshitellel kapcsolatos kedvezményekről és az elérhető állami támogatásokról.",
                ),
                const SizedBox(
                  height: 10,
                ),
                _checkBoxArea(context)
              ],
            ),
          ),
        ));
  }

  Widget _checkBoxArea(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            color: Colors.transparent,
            child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: false,
                onChanged: (value) {})),
        Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Hozzájárulok ahhoz, hogy a K&H\n"
                        "Bank Zrt. az alkalmazásban\n"
                        "megadott adataimat felhasználja és\n"
                        "megkeressen marketing és felmérés\n"
                        "céljából. "
                        "Részletek az ",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 17)),
                TextSpan(
                    text: "Adatkezelési\ntájékoztatóban.",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 17, color: Theme.of(context).primaryColor))
              ]),
            ),
          ],
        )
      ],
    );
  }
}
