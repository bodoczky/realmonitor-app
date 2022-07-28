import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/utils/string_formatters.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_original/filters_widget_original_body.dart';

class FiltersWidgetOriginal extends StatelessWidget {
  final FilterModel model;
  const FiltersWidgetOriginal({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToResultsScreen(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0.0, 10)),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              _buildSubHeader(context),
              FiltersWidgetOriginalBody(model: model),
              _buildBottomControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      model.name ?? "",
      style: Theme.of(context)
          .textTheme
          .headline1
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSubHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        estateTypeFormatter(model),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget _buildBottomControls() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.delete,
            size: 35,
          ),
          Icon(Icons.notifications, size: 35),
          Icon(Icons.edit, size: 35),
        ],
      ),
    );
  }

  _navigateToResultsScreen(BuildContext context) {
    BlocProvider.of<NavigationBloc>(context).add(NavigationEventAdd(
        Screen.results, ResultsScreenArgModel(title: model.name)));
  }
}
