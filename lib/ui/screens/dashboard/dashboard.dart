import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/features/navigation/bloc/navigation_bloc.dart';
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
          Navigator.of(context).pushNamed(state.page);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Figyelések"),
          ),
          body: const FiltersScreen(),
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () {
                context
                    .read<NavigationBloc>()
                    .add(const NavigationEventAdd("/settings"));

                // context.read<FiltersBloc>().add(LoadFiltersEvent());
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
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd("/settings"));
                    },
                    icon: Icons.visibility,
                    text: "Figyelések"),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd("/settings"));
                    },
                    icon: Icons.search,
                    text: "Találatok"),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd("/settings"));
                    },
                    icon: Icons.favorite,
                    text: "Kedvencek"),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd("/settings"));
                    },
                    icon: Icons.pie_chart,
                    text: "Piacinfó"),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd("/settings"));
                    },
                    icon: Icons.attach_money,
                    text: "Pénzügyi extrák"),
                const Divider(
                  height: 10,
                ),
                _buildDrawerMenuItems(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(const NavigationEventAdd("/settings"));
                    },
                    icon: Icons.settings,
                    text: "Beállítások"),
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
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
