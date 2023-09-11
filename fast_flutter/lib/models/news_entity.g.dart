// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsEntity _$NewsEntityFromJson(Map<String, dynamic> json) => NewsEntity()
  ..code = json['code'] as int?
  ..msg = json['msg'] as String?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => NewsData.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = json['total'] as int?;

Map<String, dynamic> _$NewsEntityToJson(NewsEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
      'total': instance.total,
    };

NewsData _$NewsDataFromJson(Map<String, dynamic> json) => NewsData()
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..createTime = json['createTime'] as String?
  ..updateTime = json['updateTime'] as String?
  ..url = json['url'] as String?
  ..type = json['type'] as int?
  ..content = json['content'] as String?;

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'url': instance.url,
      'type': instance.type,
      'content': instance.content,
    };
