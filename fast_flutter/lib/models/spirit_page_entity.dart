import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'attributes_entity.dart';

part 'spirit_page_entity.g.dart';

@JsonSerializable()
class SpiritPageEntity {
	int? code = 0;
	String? msg = '';
	List<SpiritPageData>? data = [];
	int? total = 0;

	SpiritPageEntity();

	factory SpiritPageEntity.fromJson(Map<String, dynamic> json) => _$SpiritPageEntityFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritPageEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SpiritPageData {
	int? id = 0;
	String? number = '';
	String? avatar = '';
	String? name = '';
	AttributesEntity? primaryAttributes;
	AttributesEntity? secondaryAttributes;

	SpiritPageData();

	factory SpiritPageData.fromJson(Map<String, dynamic> json) => _$SpiritPageDataFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritPageDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}