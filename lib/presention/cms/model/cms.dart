import 'package:json_annotation/json_annotation.dart';

part 'cms.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class GeneralResponse {
  @JsonKey(defaultValue: [])
  List<CmsResponse>? groups;

  GeneralResponse({
    this.groups,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> jsonData) => _$GeneralResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CmsResponse {
  @JsonKey(defaultValue: '')
  final String module;
  @JsonKey(defaultValue: [])
  List<Lesson>? lessons;

  CmsResponse({
    required this.module,
    required this.lessons,
  });

  factory CmsResponse.fromJson(Map<String, dynamic> jsonData) => _$CmsResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$CmsResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Lesson {
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String subtitle;
  @JsonKey(defaultValue: '')
  final String body;
  @JsonKey(defaultValue: '')
  final String image;

  Lesson({
    required this.title,
    required this.subtitle,
    required this.body,
    required this.image,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
