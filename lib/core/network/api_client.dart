import 'package:dio/dio.dart';
import 'package:flutter_test_avilatek/core/utils/constants.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseURL));

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      params ??= {};
      params['api_key'] = ApiConstants.apiKey;
      // print('URL:${ApiConstants.baseURL}, $endpoint, $params');
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      throw Exception("Request Error: $e");
    }
  }
}
