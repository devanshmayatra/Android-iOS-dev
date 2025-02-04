import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';

class ResponseModel {
  ResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      photos: (map['photos'] as List)
          .map(
            (e) => WallpaperDataModel.fromMap(e),
          )
          .toList(),
      totalResults: map['total_results'] as int,
    );
  }

  final int page;
  final int perPage;
  final List<WallpaperDataModel> photos;
  final int totalResults;
}
