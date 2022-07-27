import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'dart:math' as math;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profil"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _buildTitle(context),
              IgnorePointer(
                ignoring: true,
                child: TextFormField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Color(0xff3f4854),
                    ),
                    hintText: "pl.: +36301111111",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Tervezted, hogy az alábbi banki szolgáltatásokat igénybe veszed a hitelfelvételednél?",
                style: TextStyle(fontSize: 17),
              ),
              Column(
                children: [
                  _buildCheckBoxRow(text: "CSOK"),
                  _buildCheckBoxRow(text: "Zöld otthon"),
                  _buildCheckBoxRow(text: "Lakáshitel"),
                  _buildCheckBoxRow(text: "Babaváró hitel"),
                ],
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("  Mikor szeretnél ingatlant vásárolni?")),
              IgnorePointer(
                ignoring: true,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Transform.rotate(
                          angle: 270 * math.pi / 180,
                          child: const Icon(Icons.chevron_left)),
                      hintText: "Csak nézelődök"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildCheckBoxRow({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "Személyes adatok módosítása",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
