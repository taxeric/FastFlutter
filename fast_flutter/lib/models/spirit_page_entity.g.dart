// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spirit_page_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpiritPageEntity _$SpiritPageEntityFromJson(Map<String, dynamic> json) =>
    SpiritPageEntity()
      ..code = json['code'] as int?
      ..msg = json['msg'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => SpiritPageData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = json['total'] as int?;

Map<String, dynamic> _$SpiritPageEntityToJson(SpiritPageEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
      'total': instance.total,
    };

SpiritPageData _$SpiritPageDataFromJson(Map<String, dynamic> json) =>
    SpiritPageData()
      ..id = json['id'] as int?
      ..number = json['number'] as String?
      ..avatar = json['avatar'] as String?
      ..name = json['name'] as String?
      ..primaryAttributes = json['primaryAttributes'] == null
          ? null
          : AttributesEntity.fromJson(
              json['primaryAttributes'] as Map<String, dynamic>)
      ..secondaryAttributes = json['secondaryAttributes'] == null
          ? null
          : AttributesEntity.fromJson(
              json['secondaryAttributes'] as Map<String, dynamic>);

Map<String, dynamic> _$SpiritPageDataToJson(SpiritPageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'avatar': instance.avatar,
      'name': instance.name,
      'primaryAttributes': instance.primaryAttributes,
      'secondaryAttributes': instance.secondaryAttributes,
    };
