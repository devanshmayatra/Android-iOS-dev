import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_wallpaper_app/core/env_service.dart';
import 'package:firebase_wallpaper_app/modules/explore/model/response_model.dart';

class ExlporeFetchImagesService {
  final _client = Dio(
    BaseOptions(
      headers: {
        'Authorization': EnvService.apiKey,
      },
    ),
  );

  Future<Either<String, ResponseModel>> getWallpapers() async {
    try {
      final response = await _client.get(
        'https://api.pexels.com/v1/curated',
        queryParameters: {
          'page': 1,
          'per_page': 10,
        },
      );
      if (response.statusCode == 200) {
        final result = ResponseModel.fromMap(response.data);
        return Right(result);
      }
      return Left('Something went wrong');
    } on DioException catch (e) {
      return Left(e.message ?? 'Something went wrong');
    }
  }
}
