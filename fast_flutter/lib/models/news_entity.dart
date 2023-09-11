import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'news_entity.g.dart';

@JsonSerializable()
class NewsEntity {
	int? code = 0;
	String? msg = '';
	List<NewsData>? data = [];
	int? total = 0;

	NewsEntity();

	factory NewsEntity.fromJson(Map<String, dynamic> json) => _$NewsEntityFromJson(json);

	Map<String, dynamic> toJson() => _$NewsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewsData {
	int? id = 0;
	String? title = '';
	String? createTime = '';
	String? updateTime = '';
	String? url = '';
	int? type = 0;
	String? content = '';

	NewsData();

	factory NewsData.fromJson(Map<String, dynamic> json) => _$NewsDataFromJson(json);

	Map<String, dynamic> toJson() => _$NewsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}