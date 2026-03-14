import 'package:camera/camera.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_camera_repository.dart';

class CameraUseCase{

  final UseCameraRepository cameraRepository;
  CameraUseCase({required this.cameraRepository});
  
  Future<CameraController> initializedCamera(int index){
    return cameraRepository.initializedCamera(index);
  }
  Future<void> takePicture(CameraController controller) async{
    cameraRepository.takePicture(controller);
  }
  Future<void> switchCamera(CameraController controller) async{
    cameraRepository.switchCamera(controller);
  }
  Future<void> disposeCamera(CameraController controller) async{
    cameraRepository.disposeCamera(controller);
  }

}