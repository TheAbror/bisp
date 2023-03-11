import 'dart:io';
import 'package:chopper/chopper.dart';

import 'package:http/io_client.dart' as http;

import 'custom_converter.dart';

class ApiProvider {
  static late ChopperClient _client;

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        // AttendanceService.create(),
      ],
      interceptors: getInterceptors(token),
      converter: CustomDataConverter(),
    );

    // attendanceService = _client.getService<AttendanceService>();
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
