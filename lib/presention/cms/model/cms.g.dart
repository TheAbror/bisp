// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) =>
    GeneralResponse(
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => CmsResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GeneralResponseToJson(GeneralResponse instance) =>
    <String, dynamic>{
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
    };

CmsResponse _$CmsResponseFromJson(Map<String, dynamic> json) => CmsResponse(
      module: json['module'] as String? ?? '',
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CmsResponseToJson(CmsResponse instance) =>
    <String, dynamic>{
      'module': instance.module,
      'lessons': instance.lessons?.map((e) => e.toJson()).toList(),
    };

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      body: json['body'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'body': instance.body,
      'image': instance.image,
    };
