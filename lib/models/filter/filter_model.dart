import 'package:ingatlan_figyelo_teszt/models/filter/locations/filter_locations_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FilterModel {
  FilterModel({
    this.isNotificationEnabled,
    this.privateAdvertisersOnly,
    this.filterOutSuspiciousItems,
    this.onlyPolisWithPictures,
    this.nameSpace,
    this.locations,
    this.name,
    this.assignmentType,
    this.estateTypes,
    this.createTime,
    this.usesUmbrella,
    this.id,
    this.minPrice,
    this.maxPrice,
    this.minFloorArea,
    this.maxFloorArea,
    this.minUnitPrice,
    this.maxUnitPrice,
  });
  bool? isNotificationEnabled;
  bool? privateAdvertisersOnly;
  bool? filterOutSuspiciousItems;
  bool? onlyPolisWithPictures;
  String? nameSpace;
  List<FilterLocationsModel>? locations;

  String? name;
  String? assignmentType;
  List<String>? estateTypes;

  int? createTime;
  bool? usesUmbrella;
  bool? id;
  int? minPrice;
  int? maxPrice;
  int? minFloorArea;
  int? maxFloorArea;
  int? minUnitPrice;
  int? maxUnitPrice;

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
