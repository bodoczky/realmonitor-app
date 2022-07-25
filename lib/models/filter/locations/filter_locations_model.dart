import 'package:json_annotation/json_annotation.dart';

part 'filter_locations_model.g.dart';

@JsonSerializable()
class FilterLocationsModel {
  FilterLocationsModel({
    this.accessTokens,
    this.adminLevels,
    this.nameSpace,
    this.ids,
  });

  List<String>? accessTokens;
  Map<String, String>? adminLevels;
  String? nameSpace;
  List<String>? ids;

  factory FilterLocationsModel.fromJson(Map<String, dynamic> json) =>
      _$FilterLocationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterLocationsModelToJson(this);
}
