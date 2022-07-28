import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/filters/bloc/filters_bloc.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';
import 'package:ingatlan_figyelo_teszt/repositories/filters/filters_repository_impl.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/shimmer_core/shimmer.dart';
import 'package:ingatlan_figyelo_teszt/ui/common_widgets/shimmer_core/shimmer_loading.dart';
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
          FiltersBloc(RepositoryProvider.of<FiltersRepositoryImpl>(context))
            ..add(LoadFiltersEvent()),
      child: BlocBuilder<FiltersBloc, FiltersState>(builder: ((context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: (() {
            if (state is FiltersErrorState) {
              return Text(state.message);
            } else if (state is FiltersLoadedState) {
              return SingleChildScrollView(
                key: const Key('1'),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 130,
                          ),
                          FiltersWidgetOriginal(model: state.model),
                          const SizedBox(
                            height: 115,
                          ),
                          const FaIcon(FontAwesomeIcons.arrowDown),
                          const SizedBox(
                            height: 115,
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
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<NavigationBloc>(context).add(
                                  NavigationEventAdd(
                                      Screen.newIdeas,
                                      NewIdeasScreenArgModel(
                                          model: state.model)));
                            },
                            child: Container(
                              height: 450,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "tap here",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 130,
                          ),
                          Text(
                            "THE END",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return _buildLoadingAnimation(context);
          }()),
        );
      })),
    );
  }

  Column _buildLoadingAnimation(BuildContext context) {
    return Column(
      key: const Key('2'),
      children: [
        const SizedBox(
          height: 130,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Shimmer(
              child: ShimmerLoading(
                isLoading: true,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0.0, 10))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
