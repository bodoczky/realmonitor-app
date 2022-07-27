import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/utils/extensions/app_localizations_context.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is NavigationDone) {
          Navigator.of(context)
              .pushNamed(state.screen.value, arguments: state.args);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(context.loc!.watches),
          ),
          body: const FiltersScreen(),
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () {
                /* context
                    .read<NavigationBloc>()
                    .add(const NavigationEventAdd("/settings", {}));*/
              },
              tooltip: 'Új figyelés',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          drawerEnableOpenDragGesture: false,
          drawer: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDrawerMenuItems(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.visibility,
                    text: context.loc!.watches),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context).add(
                          NavigationEventAdd(
                              Screen.results,
                              ResultsScreenArgModel(
                                  title: "Sus, Suspect, Suspicious")));
                    },
                    icon: Icons.search,
                    text: context.loc!.results),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd(Screen.favorites, {}));
                    },
                    icon: Icons.favorite,
                    text: context.loc!.favorites),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd(Screen.marketInfo, {}));
                    },
                    icon: Icons.pie_chart,
                    text: context.loc!.marketInfo),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context).add(
                          const NavigationEventAdd(Screen.monetaryExtras, {}));
                    },
                    icon: Icons.attach_money,
                    text: context.loc!.monetaryExtras),
                const Divider(
                  height: 10,
                ),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd(Screen.settings, {}));
                    },
                    icon: Icons.settings,
                    text: context.loc!.settings),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat),
    );
  }

  Widget _buildDrawerMenuItems(
      {required Function() onTap,
      required IconData icon,
      required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Icon(
                  icon,
                  color: Colors.black45,
                ),
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
