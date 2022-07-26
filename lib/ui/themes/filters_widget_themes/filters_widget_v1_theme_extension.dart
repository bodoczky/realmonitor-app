import 'package:flutter/material.dart';

@immutable
class FiltersWidgetV1Theme extends ThemeExtension<FiltersWidgetV1Theme> {
  const FiltersWidgetV1Theme({
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
  FiltersWidgetV1Theme copyWith({
    Color? headerTextcolor,
    Color? bodyTextColor,
    TextStyle? dataRowTitleTextStyle,
    TextStyle? dataRowValueTextStyle,
  }) {
    return FiltersWidgetV1Theme(
      headerTextColor: headerTextcolor ?? headerTextColor,
      bodyTextColor: bodyTextColor ?? bodyTextColor,
      dataRowTitleTextStyle: dataRowTitleTextStyle ?? dataRowTitleTextStyle,
      dataRowValueTextStyle: dataRowValueTextStyle ?? dataRowValueTextStyle,
    );
  }

  @override
  FiltersWidgetV1Theme lerp(
      ThemeExtension<FiltersWidgetV1Theme>? other, double t) {
    if (other is! FiltersWidgetV1Theme) {
      return this;
    }
    return FiltersWidgetV1Theme(
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
      'FiltersV1Colors(headerTextColor: $headerTextColor, bodyTextColor: $bodyTextColor)';
}
