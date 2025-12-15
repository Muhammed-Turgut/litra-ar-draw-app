import 'package:camera/camera.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_camera_repository.dart';
import 'package:litra_ar_draw_app/main.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraRepository implements UseCameraRepository{

  late CameraController controller;

  @override
  Future<bool> requestCameraPermission() async{
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  @override
  Future<CameraController> initializedCamera(int index) async{
     final controller = CameraController(
         cameras[index],
       ResolutionPreset.medium);

     await controller.initialize();
     return controller;
  }

  @override
  Future<void> takePicture(CameraController controller) async {
    if(!controller.value.isInitialized) return;
    await controller.takePicture();
  }

  @override
  Future<void> switchCamera(CameraController controller) async {
   await controller.dispose();
  }

  @override
  Future<void> disposeCamera(CameraController controller) async {
    await controller.dispose();
  }


}