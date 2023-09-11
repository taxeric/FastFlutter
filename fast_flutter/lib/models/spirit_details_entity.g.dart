// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spirit_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpiritDetailsEntity _$SpiritDetailsEntityFromJson(Map<String, dynamic> json) =>
    SpiritDetailsEntity()
      ..code = json['code'] as int?
      ..msg = json['msg'] as String?
      ..data = json['data'] == null
          ? null
          : SpiritDetailsData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$SpiritDetailsEntityToJson(
        SpiritDetailsEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
    };

SpiritDetailsData _$SpiritDetailsDataFromJson(Map<String, dynamic> json) =>
    SpiritDetailsData()
      ..id = json['id'] as int?
      ..avatar = json['avatar'] as String?
      ..name = json['name'] as String?
      ..primaryAttributes = json['primaryAttributes'] == null
          ? null
          : AttributesEntity.fromJson(
              json['primaryAttributes'] as Map<String, dynamic>)
      ..secondaryAttributes = json['secondaryAttributes'] == null
          ? null
          : AttributesEntity.fromJson(
              json['secondaryAttributes'] as Map<String, dynamic>)
      ..groupId = json['groupId'] == null
          ? null
          : SpiritDetailsDataGroupId.fromJson(
              json['groupId'] as Map<String, dynamic>)
      ..series = json['series'] == null
          ? null
          : SpiritDetailsDataSeries.fromJson(
              json['series'] as Map<String, dynamic>)
      ..lineage = json['lineage'] == null
          ? null
          : SpiritDetailsDataLineage.fromJson(
              json['lineage'] as Map<String, dynamic>)
      ..number = json['number'] as int?
      ..height = (json['height'] as num?)?.toDouble()
      ..weight = (json['weight'] as num?)?.toDouble()
      ..hobby = json['hobby'] as String?
      ..description = json['description'] as String?
      ..racePower = json['racePower'] as int?
      ..raceAttack = json['raceAttack'] as int?
      ..raceDefense = json['raceDefense'] as int?
      ..raceMagicAttack = json['raceMagicAttack'] as int?
      ..raceMagicDefense = json['raceMagicDefense'] as int?
      ..raceSpeed = json['raceSpeed'] as int?
      ..skills = json['skills'] as List<dynamic>?;

Map<String, dynamic> _$SpiritDetailsDataToJson(SpiritDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'primaryAttributes': instance.primaryAttributes?.toJson(),
      'secondaryAttributes': instance.secondaryAttributes?.toJson(),
      'groupId': instance.groupId?.toJson(),
      'series': instance.series?.toJson(),
      'lineage': instance.lineage?.toJson(),
      'number': instance.number,
      'height': instance.height,
      'weight': instance.weight,
      'hobby': instance.hobby,
      'description': instance.description,
      'racePower': instance.racePower,
      'raceAttack': instance.raceAttack,
      'raceDefense': instance.raceDefense,
      'raceMagicAttack': instance.raceMagicAttack,
      'raceMagicDefense': instance.raceMagicDefense,
      'raceSpeed': instance.raceSpeed,
      'skills': instance.skills,
    };

SpiritDetailsDataGroupId _$SpiritDetailsDataGroupIdFromJson(
        Map<String, dynamic> json) =>
    SpiritDetailsDataGroupId()
      ..id = json['id'] as int?
      ..name = json['name'] as String?;

Map<String, dynamic> _$SpiritDetailsDataGroupIdToJson(
        SpiritDetailsDataGroupId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

SpiritDetailsDataSeries _$SpiritDetailsDataSeriesFromJson(
        Map<String, dynamic> json) =>
    SpiritDetailsDataSeries()
      ..id = json['id'] as int?
      ..name = json['name'] as String?;

Map<String, dynamic> _$SpiritDetailsDataSeriesToJson(
        SpiritDetailsDataSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

SpiritDetailsDataLineage _$SpiritDetailsDataLineageFromJson(
        Map<String, dynamic> json) =>
    SpiritDetailsDataLineage()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..introduce = json['introduce'] as String?
      ..icon = json['icon'] as String?;

Map<String, dynamic> _$SpiritDetailsDataLineageToJson(
        SpiritDetailsDataLineage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduce': instance.introduce,
      'icon': instance.icon,
    };
