import 'package:litra_ar_draw_app/presentation/enums/gallery_permission_status.dart';

abstract class UseRequestPermissionRepository {

  Future<GalleryPermissionStatus> requestGalleryPermission();
  Future<bool> requestCameraPermission();


}