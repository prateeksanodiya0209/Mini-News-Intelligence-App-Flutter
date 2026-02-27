// core/network/dio_client.dart
import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {
        'apiKey': ApiConstants.apiKey,
      },
    ),
  );
}