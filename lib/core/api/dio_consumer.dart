import 'package:dio/dio.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/end_point.dart';
import 'package:islami_app/core/errors/failures.dart';

class DioConsumer extends ApiConsumer {
  final Dio _dio;

  DioConsumer({required Dio dio}) : _dio = dio {
    _dio.options.baseUrl = EndPoint.baseUrl;
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response =
          await _dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }
}
