import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/common_widgets/open_results_button.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/filters_widget_themes/filters_widget_v2_theme_extension.dart';

class FiltersWidgetV2 extends StatelessWidget {
  final FilterModel model;
  const FiltersWidgetV2({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                gradient: const RadialGradient(
                    radius: 0.9,
                    focalRadius: 15,
                    stops: [0.4, 0.9],
                    colors: [Color(0xFF3586C8), Color(0xFF2D77B4)])),
          ),
        ),
        Positioned(
          top: 0,
          right: 60,
          child: Stack(
            children: const [
              Positioned(
                top: 30,
                left: 32,
                child: Icon(
                  Icons.home_rounded,
                  color: Colors.white12,
                  size: 40,
                ),
              ),
              Icon(
                CupertinoIcons.search,
                color: Colors.white12,
                size: 120,
              ),
            ],
          ),
        ),
        SizedBox(
          child: Padding(
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
                OpenResultsButton(
                  model: model,
                  backgroundColor: Colors.white,
                  splashColor: Colors.grey[100],
                  text: "Megnyitás",
                  textColor: const Color(0xff38668b),
                )
              ],
            ),
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
              model.name ?? "",
              style: Theme.of(context)
                  .extension<FiltersWidgetV2Theme>()
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
                      .extension<FiltersWidgetV2Theme>()
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
        Text(
          "Zabar, Csesznek",
          style: Theme.of(context)
              .extension<FiltersWidgetV2Theme>()
              ?.dataRowTitleTextStyle,
        ),
        const Divider(
          color: Colors.white12,
          thickness: 2,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ár",
              style: Theme.of(context)
                  .extension<FiltersWidgetV2Theme>()
                  ?.dataRowTitleTextStyle,
            ),
            Text(
              "69 - 420 millió Forint",
              style: Theme.of(context)
                  .extension<FiltersWidgetV2Theme>()
                  ?.dataRowValueTextStyle,
            ),
          ],
        ),
        const Divider(
          color: Colors.white12,
          thickness: 2,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Alapterület",
              style: Theme.of(context)
                  .extension<FiltersWidgetV2Theme>()
                  ?.dataRowTitleTextStyle,
            ),
            Text(
              "80+ m²",
              style: Theme.of(context)
                  .extension<FiltersWidgetV2Theme>()
                  ?.dataRowValueTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
