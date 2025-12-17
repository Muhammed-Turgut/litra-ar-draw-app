import 'dart:io' show File;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litra_ar_draw_app/domain/entitys/user_entity.dart';
import 'package:litra_ar_draw_app/domain/entitys/users_post_item.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_post_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/pick_image_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/request_camera_permission_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/share_post_use_case.dart';
import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';

class ExploreViewModel extends ChangeNotifier {
  final RequestCameraPermissionUseCase requestCameraPermissionUseCase;
  final SharePostUseCase sharePostUseCase;
  final PickImageUseCase pickImageUseCase;
  final GetUserUseCase getUserUseCase;
  final GetPostUseCase getPostUseCase;

  ExploreViewModel({
     required this.requestCameraPermissionUseCase,
     required this.sharePostUseCase,
     required this.pickImageUseCase,
     required this.getUserUseCase,
     required this.getPostUseCase
    }){
    getPost();
  }

  List<UsersPostItem> _postList = [];

  List<UsersPostItem> get postList => _postList;

  set postList(List<UsersPostItem> value) {
    _postList = value;
  }
  bool isLoading = false;

  File? _selectedImage;

  File? get getSelectedImage => _selectedImage;

  set setSelectedImage(File value) {
    _selectedImage = value;
  }

  GalleryPermissionStatus _permissionStatus = GalleryPermissionStatus.initial;
  GalleryPermissionStatus get permissionStatus => _permissionStatus;


  SharePostState _shareState = SharePostState.initial;
  SharePostState get shareState => _shareState;

  Future<String?> sharePostWithImage({
    required String userId,
    required String content,
    required File imageFile,
  }) async{
    _shareState = SharePostState.loading;
    notifyListeners();

    try {
      final result = await sharePostUseCase.sharePostWithImage(title: userId, content: content, imageFile: imageFile);

      _shareState = SharePostState.success;
      notifyListeners();
      return result;
    } catch (e) {
      _shareState = SharePostState.error;
      notifyListeners();
      return null;
    }
  }

  void resetPermissionStatus(){
    _permissionStatus = GalleryPermissionStatus.initial;
  }

  Future<void> requestGalleryPermission() async {
    _permissionStatus = GalleryPermissionStatus.granted;
    notifyListeners();

    final status = await requestCameraPermissionUseCase.requestCameraPermission();

    _permissionStatus = status as GalleryPermissionStatus;
    notifyListeners();
  }

  Future<UserEntity> getUser() async {
    return getUserUseCase.getUser();
  }

  Future<void> getPost() async {
    isLoading = true;
    notifyListeners();

    final newPostList = await getPostUseCase.getPostsList();

    print('🔥 newPostList length: ${newPostList.length}');

    _postList.addAll(newPostList);

    print('🔥 postList length: ${_postList.length}');

    isLoading = false;
    notifyListeners();
  }


}

enum SharePostState {
  initial,
  loading,
  success,
  error,
}