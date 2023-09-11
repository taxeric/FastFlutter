import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'attributes_entity.g.dart';

@JsonSerializable()
class AttributesEntity {
	int? id = 0;
	String? name = '';

	AttributesEntity();

	factory AttributesEntity.fromJson(Map<String, dynamic> json) => _$AttributesEntityFromJson(json);

	Map<String, dynamic> toJson() => _$AttributesEntityToJson(this);

	static String getAttrPath(int? attr) {
		if (attr != null) {
			if (attr > 0 && attr <= 21) {
				return "images/attr_icon/$attr.png";
			}
		}
		return "images/attr_icon/0.png";
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}