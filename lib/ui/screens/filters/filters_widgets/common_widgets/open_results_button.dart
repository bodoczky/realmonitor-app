import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';

class OpenResultsButton extends StatelessWidget {
  final FilterModel? model;
  final Color? backgroundColor;
  final Color? splashColor;
  final Color? textColor;
  final String? text;
  const OpenResultsButton({
    Key? key,
    this.model,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: backgroundColor,
            child: InkWell(
              splashColor: splashColor,
              onTap: () {
                BlocProvider.of<NavigationBloc>(context).add(NavigationEventAdd(
                    Screen.results, ResultsScreenArgModel(title: model?.name)));
              },
              child: Container(
                height: 50,
                color: Colors.transparent,
                child: Center(
                    child: Text(
                  text ?? "Megnyitás",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
