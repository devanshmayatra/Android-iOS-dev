import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/firebase_auth_service.dart';
import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';

class WallpaperService {
  final _client = FirebaseFirestore.instance;
  final _authService = FirebaseAuthService();

  DocumentReference<Map<String, dynamic>>? wallpaperRef(
      WallpaperDataModel wallpaper) {
    final currUser = _authService.getUser();
    if (currUser == null) return null;
    return _client
        .collection('users')
        .doc(currUser.uid)
        .collection('favourites')
        .doc(wallpaper.id.toString());
  }

  Future<bool?> checkIsFavourite(WallpaperDataModel wallpaper) async {
    final ref = wallpaperRef(wallpaper);
    if (ref == null) {
      return null;
    }
    ;
    return await ref.get().then((value) => value.exists);
  }

  Future<void> addToFavourites(WallpaperDataModel wallpaper) async {
    final ref = wallpaperRef(wallpaper);
    if (ref == null) return;
    await ref.set(wallpaper.toMap());
  }

  Future<void> removeFromFavpurites(WallpaperDataModel wallpaper) async {
    final ref = wallpaperRef(wallpaper);
    if (ref == null) return;
    await ref.delete();
  }
}
