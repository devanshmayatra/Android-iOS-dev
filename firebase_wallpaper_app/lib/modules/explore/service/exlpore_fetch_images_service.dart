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

  int page = 1;
  int perPage = 10;

  Future<Either<String, ResponseModel>> getWallpapers(
      int recPage, int recPerPage) async {
    page = page + recPage;
    perPage = perPage + recPerPage;
    try {
      final response = await _client.get(
        'https://api.pexels.com/v1/curated',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );
      await Future.delayed(Duration(seconds: 3));
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
