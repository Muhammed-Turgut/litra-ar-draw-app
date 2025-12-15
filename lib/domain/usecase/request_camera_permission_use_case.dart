import 'package:litra_ar_draw_app/data/repositories/camera_repository.dart';

class RequestCameraPermissionUseCase {
  //Burda camera izni isteniyor.
  final CameraRepository cameraRepository;
  RequestCameraPermissionUseCase({required this.cameraRepository});

  @override
  Future<bool> requestCameraPermission() async{
    return cameraRepository.requestCameraPermission();
  }

}