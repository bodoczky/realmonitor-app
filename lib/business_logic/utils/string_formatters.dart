import 'package:ingatlan_figyelo_teszt/models/enums/common_enums.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';

int? formatPrices(dynamic myNumber, FormatExtent formatExtent) {
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  if (myNumber == null) {
    return null;
  }
  if (formatExtent == FormatExtent.million) {
    return int.parse((myNumber / 1000000).toString().replaceAll(regex, ''));
  } else if (formatExtent == FormatExtent.thousand) {
    return int.parse((myNumber / 1000).toString().replaceAll(regex, ''));
  }
  return null;
}

String formatFiltersDataRowValue({int? lowerNumber, int? higherNumber}) {
  if (lowerNumber == null) {
    return "0 - $higherNumber";
  } else if (higherNumber == null) {
    return "$lowerNumber+";
  } else {
    return "$lowerNumber - $higherNumber";
  }
}

String estateTypeFormatter(FilterModel filterModel) {
  return "${filterModel.assignmentType?.value} ${filterModel.estateTypes?.map((e) => e.value).toString().replaceAll("(", "").replaceAll(")", "")} ";
}
