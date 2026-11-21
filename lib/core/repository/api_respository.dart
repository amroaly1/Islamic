import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/end_point.dart';
import 'package:islami_app/core/errors/failures.dart';
import 'package:islami_app/core/model/radio_model.dart';

class ApiRespository {
  final ApiConsumer api;

  ApiRespository({required this.api});
  Future<Either<Failures, List<RadioModel>>> getRadios() async {
    try {
      var data = await api
          .get(EndPoint.radio, queryParameters: {Apikey.language: 'ar'});
      List<RadioModel> radios = [];
      for (var element in data["radios"]) {
        radios.add(RadioModel.fromJson(element));
      }
      return Right(radios);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
