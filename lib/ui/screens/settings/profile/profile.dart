import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/navigation/bloc/navigation_bloc.dart';

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
        body: Column(
          children: [
            _buildTitle(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.edit,
                      color: Color(0xff3f4854),
                    ),
                    hintText: "pl.: +36301111111",
                    hintStyle: const TextStyle(color: Color(0xff3f4854)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffccd2dc), width: 2.5),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffccd2dc), width: 0),
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
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
