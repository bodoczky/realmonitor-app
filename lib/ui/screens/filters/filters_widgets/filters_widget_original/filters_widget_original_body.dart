import 'package:flutter/material.dart';
import 'package:ingatlan_figyelo_teszt/business_logic/utils/string_formatters.dart';
import 'package:ingatlan_figyelo_teszt/models/enums/common_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';

class FiltersWidgetOriginalBody extends StatelessWidget {
  final FilterModel model;
  const FiltersWidgetOriginalBody({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        color: const Color(0xfff3f6fa),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [..._listAdminLevels(context)],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            _buildDataRow(context,
                leftWidget:
                    Text("Ár", style: Theme.of(context).textTheme.bodyText1),
                rightWidget: model.assignmentType == AssignmentType.forSale
                    ? Text(
                        "${formatFiltersDataRowValue(lowerNumber: formatPrices(model.minPrice, FormatExtent.million), higherNumber: formatPrices(model.maxPrice, FormatExtent.million))} millió Forint",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : Text(
                        "${formatFiltersDataRowValue(lowerNumber: formatPrices(model.minPrice, FormatExtent.thousand), higherNumber: formatPrices(model.maxPrice, FormatExtent.thousand))} ezer Forint",
                        style: Theme.of(context).textTheme.bodyText1)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            _buildDataRow(context,
                leftWidget: Text("Alapterület",
                    style: Theme.of(context).textTheme.bodyText1),
                rightWidget: Text(
                    "${formatFiltersDataRowValue(lowerNumber: model.minFloorArea, higherNumber: model.maxFloorArea)} m²",
                    style: Theme.of(context).textTheme.bodyText1)),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(BuildContext context,
      {required Widget leftWidget, required Widget rightWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Flexible(
              flex: 4,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width, child: leftWidget)),
          Flexible(
              flex: 6,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: rightWidget)),
        ],
      ),
    );
  }

  List<Widget> _listAdminLevels(BuildContext context) {
    List<Widget> adminLevels = [];
    if (model.locations != null) {
      for (int index = 0; index < model.locations!.length; index++) {
        index + 1 != model.locations?.length
            ? adminLevels.add(Text(
                "${model.locations?[index].adminLevels?["8"]}, ",
                style: Theme.of(context).textTheme.bodyText1))
            : adminLevels.add(Text(
                "${model.locations?[index].adminLevels?["8"]}",
                style: Theme.of(context).textTheme.bodyText1));
      }
      return adminLevels;
    } else {
      return adminLevels;
    }
  }
}
