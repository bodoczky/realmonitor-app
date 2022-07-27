import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'dart:math' as math;

import 'package:ingatlan_figyelo_teszt/ui/screens/results/results_shimmer/results_screen_shimmer.dart';

class ResultsScreen extends StatelessWidget {
  final String? title;
  const ResultsScreen({Key? key, this.title}) : super(key: key);
  final bool backEndConnected = false; //just for prototyping

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<NavigationBloc>(context).add(NavigationEventPop());
          return Future(() => true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title ?? ""),
            actions: [
              _buildActionsButton(
                  iconData: FontAwesomeIcons.landmark, onTap: () {}),
              _buildActionsButton(
                  iconData: FontAwesomeIcons.arrowRightArrowLeft,
                  onTap: () {},
                  rotationAngle: 90),
              _buildActionsButton(
                  iconData: FontAwesomeIcons.sliders,
                  onTap: () {},
                  rotationAngle: 90),
            ],
          ),
          body: backEndConnected
              ? const SizedBox()
              : const ResultsScreenShimmer(),
        ));
  }

  Widget _buildActionsButton(
      {required IconData iconData,
      required Function() onTap,
      int? rotationAngle}) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Transform.rotate(
                angle:
                    rotationAngle != null ? rotationAngle * math.pi / 180 : 0,
                child: FaIcon(
                  iconData,
                  size: 20,
                )),
          ),
        ),
      ),
    );
  }
}
