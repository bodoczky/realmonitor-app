import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/filters/bloc/filters_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/filters/repository/filters_repository.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_original/filters_widget_original.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_v1/filters_widget_v1.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_v2/filters_widget_v2.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_v3/filters_widget_v3.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FiltersBloc>(
      create: (context) =>
          FiltersBloc(RepositoryProvider.of<FiltersRepository>(context))
            ..add(LoadFiltersEvent()),
      child: Center(
        child:
            BlocBuilder<FiltersBloc, FiltersState>(builder: ((context, state) {
          if (state is FiltersErrorState) {
            return Text(state.message);
          } else if (state is FiltersLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    FiltersWidgetOriginal(model: state.model),
                    const SizedBox(
                      height: 230,
                    ),
                    FiltersWidgetV1(model: state.model),
                    const SizedBox(
                      height: 230,
                    ),
                    FiltersWidgetV2(model: state.model),
                    const SizedBox(
                      height: 230,
                    ),
                    FiltersWidgetV3(model: state.model),
                    const SizedBox(
                      height: 230,
                    ),
                  ],
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        })),
      ),
    );
  }
}
