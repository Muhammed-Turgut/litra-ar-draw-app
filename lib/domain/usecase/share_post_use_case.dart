
import 'dart:io';

import 'package:litra_ar_draw_app/data/repositories/post_repository.dart';

class SharePostUseCase {
  final PostRepository postRepository;
  SharePostUseCase({required this.postRepository});

  Future<String?> sharePostWithImage({
    required String title,
    required String content,
    required File imageFile})
       async{

      postRepository.sharePostWithImage(title: title, content: content, imageFile: imageFile);

  }
}