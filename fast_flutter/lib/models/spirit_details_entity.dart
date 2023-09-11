import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'attributes_entity.dart';

part 'spirit_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SpiritDetailsEntity {
	int? code = 0;
	String? msg = '';
	SpiritDetailsData? data;

	SpiritDetailsEntity();

	factory SpiritDetailsEntity.fromJson(Map<String, dynamic> json) => _$SpiritDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable(explicitToJson: true)
class SpiritDetailsData {
	int? id = 0;
	String? avatar = '';
	String? name = '';
	AttributesEntity? primaryAttributes;
	AttributesEntity? secondaryAttributes;
	SpiritDetailsDataGroupId? groupId;
	SpiritDetailsDataSeries? series;
	SpiritDetailsDataLineage? lineage;
	int? number = 0;
	double? height = 0.0;
	double? weight = 0.0;
	String? hobby = '';
	String? description = '';
	int? racePower = 0;
	int? raceAttack = 0;
	int? raceDefense = 0;
	int? raceMagicAttack = 0;
	int? raceMagicDefense = 0;
	int? raceSpeed = 0;
	List<dynamic>? skills = [];

	SpiritDetailsData();

	factory SpiritDetailsData.fromJson(Map<String, dynamic> json) => _$SpiritDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritDetailsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable(explicitToJson: true)
class SpiritDetailsDataGroupId {
	int? id = 0;
	String? name = '';

	SpiritDetailsDataGroupId();

	factory SpiritDetailsDataGroupId.fromJson(Map<String, dynamic> json) => _$SpiritDetailsDataGroupIdFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritDetailsDataGroupIdToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable(explicitToJson: true)
class SpiritDetailsDataSeries {
	int? id = 0;
	String? name = '';

	SpiritDetailsDataSeries();

	factory SpiritDetailsDataSeries.fromJson(Map<String, dynamic> json) => _$SpiritDetailsDataSeriesFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritDetailsDataSeriesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable(explicitToJson: true)
class SpiritDetailsDataLineage {
	int? id = 0;
	String? name = '';
	String? introduce = '';
	String? icon = '';

	SpiritDetailsDataLineage();

	factory SpiritDetailsDataLineage.fromJson(Map<String, dynamic> json) => _$SpiritDetailsDataLineageFromJson(json);

	Map<String, dynamic> toJson() => _$SpiritDetailsDataLineageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}