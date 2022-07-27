import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/localization/bloc/localization_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/utils/extensions/app_localizations_context.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc!.settings),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildMenuItem(context,
                      iconData: Icons.person,
                      text: context.loc!.profile, onTap: () {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(const NavigationEventAdd(Screen.profile, {}));
                  }),
                  _buildMenuItem(context,
                      iconData: Icons.privacy_tip,
                      text: context.loc!.dataProcessing, onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(
                        const NavigationEventAdd(Screen.dataProcessing, {}));
                  }),
                  _buildMenuItem(context,
                      iconData: FontAwesomeIcons.arrowRightArrowLeft,
                      text: context.loc!.switchLanguage,
                      onTap: () => context.loc!.localeName == "hu"
                          ? BlocProvider.of<LocalizationBloc>(context)
                              .add(const ChangeLocaleEvent(Locale("en")))
                          : BlocProvider.of<LocalizationBloc>(context)
                              .add(const ChangeLocaleEvent(Locale("hu")))),
                  _buildMenuItem(context,
                      iconData: Icons.logout,
                      text: context.loc!.logOut,
                      onTap: () {}),
                  _buildMenuItem(context,
                      iconData: FontAwesomeIcons.xmark,
                      text: context.loc!.deleteAccount,
                      onTap: () {}),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Text("2.7.5"),
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required Function() onTap,
      required IconData iconData,
      required String text}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Icon(
                  iconData,
                  size: 35,
                  color: Colors.black45,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
