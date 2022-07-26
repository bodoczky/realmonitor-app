import 'package:flutter/material.dart';

@immutable
class FiltersWidgetV3Theme extends ThemeExtension<FiltersWidgetV3Theme> {
  const FiltersWidgetV3Theme({
    this.headerTextColor,
    this.bodyTextColor,
    this.dataRowTitleTextStyle,
    this.dataRowValueTextStyle,
  });

  final Color? headerTextColor;
  final Color? bodyTextColor;
  final TextStyle? dataRowTitleTextStyle;
  final TextStyle? dataRowValueTextStyle;

  @override
  FiltersWidgetV3Theme copyWith({
    Color? headerTextcolor,
    Color? bodyTextColor,
    TextStyle? dataRowTitleTextStyle,
    TextStyle? dataRowValueTextStyle,
  }) {
    return FiltersWidgetV3Theme(
      headerTextColor: headerTextcolor ?? headerTextColor,
      bodyTextColor: bodyTextColor ?? bodyTextColor,
      dataRowTitleTextStyle: dataRowTitleTextStyle ?? dataRowTitleTextStyle,
      dataRowValueTextStyle: dataRowValueTextStyle ?? dataRowValueTextStyle,
    );
  }

  @override
  FiltersWidgetV3Theme lerp(
      ThemeExtension<FiltersWidgetV3Theme>? other, double t) {
    if (other is! FiltersWidgetV3Theme) {
      return this;
    }
    return FiltersWidgetV3Theme(
      headerTextColor: Color.lerp(headerTextColor, other.headerTextColor, t),
      bodyTextColor: Color.lerp(bodyTextColor, other.bodyTextColor, t),
      dataRowTitleTextStyle:
          TextStyle.lerp(dataRowTitleTextStyle, other.dataRowTitleTextStyle, t),
      dataRowValueTextStyle:
          TextStyle.lerp(dataRowValueTextStyle, other.dataRowValueTextStyle, t),
    );
  }

  @override
  String toString() =>
      'FiltersWidgetV2Colors(headerTextColor: $headerTextColor, bodyTextColor: $bodyTextColor)';
}
