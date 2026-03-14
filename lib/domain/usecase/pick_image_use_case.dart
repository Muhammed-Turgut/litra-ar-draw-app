import 'dart:io' show File;

import 'package:image_picker/image_picker.dart' show ImageSource;
import 'package:litra_ar_draw_app/data/repositories/post_repository_impl.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_post_repository.dart';

class PickImageUseCase {
  final UsePostRepository postRepository;
  PickImageUseCase({required this.postRepository});

  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async{
    return postRepository.pickImage(source: source);
  }
}