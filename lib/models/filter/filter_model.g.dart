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
      assignmentType:
          $enumDecodeNullable(_$AssignmentTypeEnumMap, json['assignmentType']),
      estateTypes: (json['estateTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EstateTypesEnumMap, e))
          .toList(),
      createTime: json['createTime'] as int?,
      usesUmbrella: json['usesUmbrella'] as bool?,
      id: json['id'] as int?,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      minFloorArea: json['minFloorArea'] as int?,
      maxFloorArea: json['maxFloorArea'] as int?,
      minUnitPrice: (json['minUnitPrice'] as num?)?.toDouble(),
      maxUnitPrice: (json['maxUnitPrice'] as num?)?.toDouble(),
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
      'assignmentType': _$AssignmentTypeEnumMap[instance.assignmentType],
      'estateTypes':
          instance.estateTypes?.map((e) => _$EstateTypesEnumMap[e]!).toList(),
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

const _$AssignmentTypeEnumMap = {
  AssignmentType.forSale: 'FOR_SALE',
  AssignmentType.toLet: 'TO_LET',
};

const _$EstateTypesEnumMap = {
  EstateTypes.house: 'HOUSE',
  EstateTypes.flat: 'FLAT',
};
