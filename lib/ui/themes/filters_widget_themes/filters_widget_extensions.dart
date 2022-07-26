import 'package:flutter/material.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/filters_widget_themes/filters_widget_v1_theme_extension.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/filters_widget_themes/filters_widget_v2_theme_extension.dart';
import 'package:ingatlan_figyelo_teszt/ui/themes/filters_widget_themes/filters_widget_v3_theme_extension.dart';

class FiltersThemeExtensions {
  Iterable<ThemeExtension<dynamic>>? filtersThemeExtensions = [
    FiltersWidgetV1Theme(
      bodyTextColor: const Color(0xFF95a4b1),
      headerTextColor: const Color(0xFF2c4c68),
      dataRowTitleTextStyle: const TextStyle(
          color: Color(0xFF2c4c68), fontSize: 16, fontWeight: FontWeight.bold),
      dataRowValueTextStyle: TextStyle(
          color: const Color(0xFF2c4c68).withOpacity(0.5),
          fontSize: 14,
          fontWeight: FontWeight.w400),
    ),
    const FiltersWidgetV2Theme(
      bodyTextColor: Color(0xFFE7E7E7),
      headerTextColor: Color(0xFF2c4c68),
      dataRowTitleTextStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      dataRowValueTextStyle: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    ),
    const FiltersWidgetV3Theme(
      bodyTextColor: Color(0xFFE7E7E7),
      headerTextColor: Color(0xFF2c4c68),
      dataRowTitleTextStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      dataRowValueTextStyle: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    ),
  ];
}
