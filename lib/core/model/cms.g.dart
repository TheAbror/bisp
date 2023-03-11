// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimetableResponse _$TimetableResponseFromJson(Map<String, dynamic> json) =>
    TimetableResponse(
      generalInfo: json['general_info'] == null
          ? null
          : GeneralInfo.fromJson(json['general_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimetableResponseToJson(TimetableResponse instance) =>
    <String, dynamic>{
      'general_info': instance.generalInfo?.toJson(),
    };

GeneralInfo _$GeneralInfoFromJson(Map<String, dynamic> json) => GeneralInfo(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$GeneralInfoToJson(GeneralInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
