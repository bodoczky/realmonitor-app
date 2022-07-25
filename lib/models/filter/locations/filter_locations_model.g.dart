// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_locations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterLocationsModel _$FilterLocationsModelFromJson(
        Map<String, dynamic> json) =>
    FilterLocationsModel(
      accessTokens: (json['accessTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adminLevels: (json['adminLevels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      nameSpace: json['nameSpace'] as String?,
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FilterLocationsModelToJson(
        FilterLocationsModel instance) =>
    <String, dynamic>{
      'accessTokens': instance.accessTokens,
      'adminLevels': instance.adminLevels,
      'nameSpace': instance.nameSpace,
      'ids': instance.ids,
    };
