import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';

class MonetaryExtrasScreen extends StatelessWidget {
  const MonetaryExtrasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
          return Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Pénzügyi extrák")),
          body: Column(
            children: [
              _buildHeader(context),
              const SizedBox(
                height: 5,
              ),
              _buildRow(context,
                  iconData: FontAwesomeIcons.calculator,
                  title: "mennyi hitelt kaphatok?"),
              _buildRow(context,
                  iconData: FontAwesomeIcons.faceTired,
                  title: "törlesztőrészletem"),
              _buildRow(context,
                  iconData: FontAwesomeIcons.book, title: "kisokos"),
              _buildRow(context,
                  iconData: FontAwesomeIcons.squarePhone,
                  title: "visszahívunk!"),
            ],
          ),
        ));
  }

  Widget _buildRow(BuildContext context,
      {Function()? onTap, required IconData iconData, required String title}) {
    return GestureDetector(
      onTap: () => onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 10))
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 40,
                  child: FaIcon(
                    iconData,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "pénzügyi partner",
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/images/logos/kh_logo.png",
            height: 50,
          ),
        ],
      ),
    );
  }
}
