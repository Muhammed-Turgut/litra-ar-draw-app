import 'package:litra_ar_draw_app/data/repositories/post_repository.dart';
import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';

class RequestGalleryPermissionUseCase {
  final PostRepository postRepository;
  RequestGalleryPermissionUseCase({required this.postRepository});

  //Burda Gallery için izin isteniyor.
  Future<GalleryPermissionStatus> requestGalleryPermission() async{
    return postRepository.requestGalleryPermission();
  }
}