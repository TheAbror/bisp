import 'package:json_annotation/json_annotation.dart';

part 'cms.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TimetableResponse {
  @JsonKey(name: 'general_info')
  GeneralInfo? generalInfo;

  TimetableResponse({
    required this.generalInfo,
  });

  factory TimetableResponse.fromJson(Map<String, dynamic> jsonData) => _$TimetableResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$TimetableResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class GeneralInfo {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;

  GeneralInfo({
    required this.id,
    required this.title,
  });

  factory GeneralInfo.fromJson(Map<String, dynamic> jsonData) => _$GeneralInfoFromJson(jsonData);
  Map<String, dynamic> toJson() => _$GeneralInfoToJson(this);
}
