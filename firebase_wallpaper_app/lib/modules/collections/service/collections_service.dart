import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/firebase_auth_service.dart';
import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';

class CollectionsService {
  final _client = FirebaseFirestore.instance;
  final _authService = FirebaseAuthService();

  DocumentReference<Map<String, dynamic>>? collectionRef(
      String collectionName, String status) {
    final currUser = _authService.getUser();
    if (currUser == null) return null;
    if (status == "private") {
      return _client
          .collection('users')
          .doc(currUser.uid)
          .collection('collections')
          .doc(collectionName);
    } else {
      return _client.collection('collections').doc(collectionName);
    }
  }

  void createCollection(String collectionName, String status) async {
    User currUser = _authService.getUser();
    DocumentReference<Map<String, dynamic>>? ref =
        collectionRef(collectionName, status);
    if (ref == null) return;
    await ref.set({
      'name': collectionName,
      'status': status,
      'owner': currUser.uid,
      'ownerName': currUser.displayName,
    });
  }

  Future<List<Map<String, dynamic>>?> fetchAllCollections() async {
    final currUser = _authService.getUser();
    final snapshotPublic = await _client.collection('collections').get();
    final snapshotPrivate = await _client
        .collection('users')
        .doc(currUser.uid)
        .collection('collections')
        .get();
    final publicCollections =
        snapshotPublic.docs.map((doc) => doc.data()).toList();
    final privateCollections =
        snapshotPrivate.docs.map((doc) => doc.data()).toList();
    final allCollections = [...publicCollections, ...privateCollections]
        .map((doc) => doc)
        .toList();
    return allCollections;
  }

  DocumentReference<Map<String, dynamic>>? setWallpaperref(
      String collectionName, String status, WallpaperDataModel wallpaper) {
    final currUser = _authService.getUser();
    if (currUser == null) return null;
    if (status == "private") {
      return _client
          .collection('users')
          .doc(currUser.uid)
          .collection('collections')
          .doc(collectionName)
          .collection('images')
          .doc(wallpaper.id.toString());
    } else {
      return _client
          .collection('collections')
          .doc(collectionName)
          .collection('images')
          .doc(wallpaper.id.toString());
    }
  }

  void addImageToCOllection(Map collection, WallpaperDataModel wallpaper) {
    DocumentReference<Map<String, dynamic>>? ref =
        setWallpaperref(collection["name"], collection["status"], wallpaper);
    if (ref == null) return;
    ref.set(wallpaper.toMap());
  }

  Future<List<dynamic>?> getCollectionWallpapers(
      String name, String status) async {
    final currUser = _authService.getUser();
    late final ref;
    if (currUser == null) return null;
    if (status == "private") {
      ref = _client
          .collection('users')
          .doc(currUser.uid)
          .collection('collections')
          .doc(name)
          .collection('images');
    } else {
      ref = _client.collection('collections').doc(name).collection('images');
    }
    final snapshot = await ref.get();
    return snapshot.docs
        .map((doc) => WallpaperDataModel.fromMap(doc.data()))
        .toList();
  }

  void removeWallpaperFromCollection(
      Map collection, WallpaperDataModel wallpaper) async {
    final currUser = _authService.getUser();
    final ref =
        setWallpaperref(collection["name"], collection["status"], wallpaper);
    if (ref == null) return;
    if (collection["owner"] == currUser.uid) {
      await ref.delete();
    }
  }
}
