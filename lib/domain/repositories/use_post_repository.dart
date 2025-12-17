import 'dart:io' show File;

import 'package:image_picker/image_picker.dart';
import 'package:litra_ar_draw_app/domain/entitys/users_post_item.dart';
import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';

abstract class UsePostRepository {

  Future<File?> pickImage({ImageSource source = ImageSource.gallery});

  Future<String?> sharePostWithImage({
    required String title,
    required String content,
    required File imageFile,
  });

  Future<String?> createPost({
    required UsersPostItem userPostItem});

  Future<String?> uploadImage({
    required File imageFile,
    required String userId,
  });


  //Yüklenen postu silmek için
  Future<void> deletePost(String postId, String userId) async{}

  Future<GalleryPermissionStatus> requestGalleryPermission();

  Future<List<UsersPostItem>> getPostList();
}