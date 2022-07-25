// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      isNotificationEnabled: json['isNotificationEnabled'] as bool?,
      privateAdvertisersOnly: json['privateAdvertisersOnly'] as bool?,
      filterOutSuspiciousItems: json['filterOutSuspiciousItems'] as bool?,
      onlyPolisWithPictures: json['onlyPolisWithPictures'] as bool?,
      nameSpace: json['nameSpace'] as String?,
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => FilterLocationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      assignmentType: json['assignmentType'] as String?,
      estateTypes: (json['estateTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createTime: json['createTime'] as int?,
      usesUmbrella: json['usesUmbrella'] as bool?,
      id: json['id'] as bool?,
      minPrice: json['minPrice'] as int?,
      maxPrice: json['maxPrice'] as int?,
      minFloorArea: json['minFloorArea'] as int?,
      maxFloorArea: json['maxFloorArea'] as int?,
      minUnitPrice: json['minUnitPrice'] as int?,
      maxUnitPrice: json['maxUnitPrice'] as int?,
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'isNotificationEnabled': instance.isNotificationEnabled,
      'privateAdvertisersOnly': instance.privateAdvertisersOnly,
      'filterOutSuspiciousItems': instance.filterOutSuspiciousItems,
      'onlyPolisWithPictures': instance.onlyPolisWithPictures,
      'nameSpace': instance.nameSpace,
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'assignmentType': instance.assignmentType,
      'estateTypes': instance.estateTypes,
      'createTime': instance.createTime,
      'usesUmbrella': instance.usesUmbrella,
      'id': instance.id,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'minFloorArea': instance.minFloorArea,
      'maxFloorArea': instance.maxFloorArea,
      'minUnitPrice': instance.minUnitPrice,
      'maxUnitPrice': instance.maxUnitPrice,
    };
