import 'package:camera/camera.dart';

abstract class UseCameraRepository{

  Future<bool> requestCameraPermission();
  Future<CameraController> initializedCamera(int index);
  Future<void> takePicture(CameraController controller) async{}
  Future<void> switchCamera(CameraController controller) async{}
  Future<void> disposeCamera(CameraController controller) async{}

}