import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/navigation/bloc/navigation_bloc.dart';

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
          title: const Text("Beállítások"),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildMenuItem(context,
                      iconData: Icons.person, text: "Profil"),
                  _buildMenuItem(context,
                      iconData: Icons.privacy_tip, text: "Adatkezelés"),
                  _buildMenuItem(context,
                      iconData: Icons.language, text: "Switch to English"),
                  _buildMenuItem(context,
                      iconData: Icons.logout, text: "Kijelentkezés"),
                  _buildMenuItem(context,
                      iconData: Icons.no_accounts, text: "Fiók törlése"),
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
      {required IconData iconData, required String text}) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavigationBloc>(context)
            .add(const NavigationEventAdd("/profile"));
      },
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
    );
  }
}
