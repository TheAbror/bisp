// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TimetableService extends TimetableService {
  _$TimetableService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TimetableService;

  @override
  Future<Response<TimetableResponse>> getTimetableInfo({int? groupID}) {
    final $url = 'https://api.edulab.app/edulab_udea/api/v1/signin';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TimetableResponse, TimetableResponse>($request);
  }
}
