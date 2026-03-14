import 'package:litra_ar_draw_app/domain/repositories/use_request_permission_repository.dart';
import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionRepositoryImpl implements UseRequestPermissionRepository{

  @override
  Future<bool> requestCameraPermission() async{
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  @override
  Future<GalleryPermissionStatus> requestGalleryPermission() async {
    PermissionStatus status;

    if (await Permission.photos.isGranted) {
      return GalleryPermissionStatus.granted;
    }

    status = await Permission.photos.request();

    if (status.isGranted) {
      return GalleryPermissionStatus.granted;
    } else {
      return GalleryPermissionStatus.denied;
    }
  }

}