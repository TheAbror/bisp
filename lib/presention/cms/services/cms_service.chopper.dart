// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CmsService extends CmsService {
  _$CmsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CmsService;

  @override
  Future<Response<List<CmsResponse>>> getCms() {
    final $url = 'http://127.0.0.1:8000/';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CmsResponse>, CmsResponse>($request);
  }
}
