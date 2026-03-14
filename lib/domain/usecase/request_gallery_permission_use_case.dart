import 'package:litra_ar_draw_app/data/repositories/request_permission_repository_impl.dart';
import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';

class RequestGalleryPermissionUseCase{

  final RequestPermissionRepositoryImpl requestPermissionRepository;

  RequestGalleryPermissionUseCase({ required this.requestPermissionRepository});

  Future<GalleryPermissionStatus> requestGalleryPermissionUseCase() async {
    return requestPermissionRepository.requestGalleryPermission();
  }


}