import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:eduninjav2/presention/cms/services/cms_service.dart';

import 'package:http/io_client.dart' as http;

import 'custom_converter.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late CmsService cms;

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        CmsService.create(),
      ],
      interceptors: getInterceptors(token),
      converter: CustomDataConverter(),
    );

    cms = _client.getService<CmsService>();
  }

  static List getInterceptors(token) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(HeadersInterceptor({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
    }));

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
