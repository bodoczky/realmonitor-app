import 'package:flutter/material.dart';

import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/common_widgets/open_results_button.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/filters_widget_themes/filters_widget_v1_theme_extension.dart';

class FiltersWidgetV1 extends StatelessWidget {
  final FilterModel model;
  const FiltersWidgetV1({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: const Color(0xffc5c3c0)),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xfff2f9fc), Color(0xfffdf8ee)])),
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
              backgroundColor: const Color(0xff2c4c68),
              splashColor: const Color(0xff2c4c68),
              text: "Megnyitás",
              textColor: Colors.white,
            )
          ],
        ),
      ),
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
                  .extension<FiltersWidgetV1Theme>()
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
                      .extension<FiltersWidgetV1Theme>()
                      ?.bodyTextColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const Icon(
          Icons.more_vert,
          size: 30,
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
              .extension<FiltersWidgetV1Theme>()
              ?.dataRowTitleTextStyle,
        ),
        const Divider(
          thickness: 2,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ár",
              style: Theme.of(context)
                  .extension<FiltersWidgetV1Theme>()
                  ?.dataRowTitleTextStyle,
            ),
            Text(
              "69 - 420 millió Forint",
              style: Theme.of(context)
                  .extension<FiltersWidgetV1Theme>()
                  ?.dataRowValueTextStyle,
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Alapterület",
              style: Theme.of(context)
                  .extension<FiltersWidgetV1Theme>()
                  ?.dataRowTitleTextStyle,
            ),
            Text(
              "80+ m²",
              style: Theme.of(context)
                  .extension<FiltersWidgetV1Theme>()
                  ?.dataRowValueTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
