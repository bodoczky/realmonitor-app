import 'package:ingatlan_figyelo_teszt/models/enums/enums.dart';

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
