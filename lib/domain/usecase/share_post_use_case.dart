
import 'dart:io';

import 'package:litra_ar_draw_app/data/repositories/post_repository_impl.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_post_repository.dart';

class SharePostUseCase {
  final UsePostRepository postRepository;
  SharePostUseCase({required this.postRepository});

  Future<String?> sharePostWithImage({
    required String title,
    required String content,
    required File imageFile})
       async{

      postRepository.sharePostWithImage(title: title, content: content, imageFile: imageFile);

  }
}