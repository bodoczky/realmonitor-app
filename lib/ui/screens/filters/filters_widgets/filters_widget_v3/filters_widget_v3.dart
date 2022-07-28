import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/core/navigation/bloc/navigation_bloc.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/route_name_enums.dart';

import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/models/route_arguments/results_screen_arg_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_v3/radar_view.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/filters_widget_themes/filters_widget_v3_theme_extension.dart';

class FiltersWidgetV3 extends StatelessWidget {
  final FilterModel model;
  const FiltersWidgetV3({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: const Color(0xffc5c3c0)),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/filters_widget/house.jpg"))),
        )),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 1.0],
                )),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                  stops: [
                    0.0,
                    0.6,
                  ],
                )),
          ),
        ),
        const Positioned(
          right: 10,
          top: 10,
          //credit: https://www.codetd.com/en/article/11667523
          child: SizedBox(height: 140, width: 140, child: RadarView()),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(
                height: 30,
              ),
              _buildBody(context),
              const SizedBox(
                height: 30,
              ),
              _buildControls(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Suspect",
              style: Theme.of(context)
                  .extension<FiltersWidgetV3Theme>()
                  ?.dataRowTitleTextStyle
                  ?.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "eladó ház",
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context)
                      .extension<FiltersWidgetV3Theme>()
                      ?.bodyTextColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const Icon(
          Icons.more_vert,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Zabar, Csesznek",
              style: Theme.of(context)
                  .extension<FiltersWidgetV3Theme>()
                  ?.dataRowTitleTextStyle,
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ár",
                  style: Theme.of(context)
                      .extension<FiltersWidgetV3Theme>()
                      ?.dataRowTitleTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "69 - 420M Forint",
                  style: Theme.of(context)
                      .extension<FiltersWidgetV3Theme>()
                      ?.dataRowValueTextStyle,
                ),
              ],
            ),
            Container(
              height: 30,
              width: 2,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alapterület",
                  style: Theme.of(context)
                      .extension<FiltersWidgetV3Theme>()
                      ?.dataRowTitleTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "80+ m²",
                  style: Theme.of(context)
                      .extension<FiltersWidgetV3Theme>()
                      ?.dataRowValueTextStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildControls(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey[100],
          onTap: () {
            BlocProvider.of<NavigationBloc>(context).add(NavigationEventAdd(
                Screen.results, ResultsScreenArgModel(title: "Suspect")));
          },
          child: Container(
            height: 50,
            color: Colors.transparent, //const Color(0xff2c4c68),
            child: const Center(
                child: Text(
              "Megnyitás",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
