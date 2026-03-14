import 'package:litra_ar_draw_app/domain/repositories/use_request_permission_repository.dart';

class RequestCameraPermissionUseCase {

  final UseRequestPermissionRepository requestPermissionRepository;
  RequestCameraPermissionUseCase({required this.requestPermissionRepository});
  
  @override
  Future<bool> requestCameraPermission() async{
    return requestPermissionRepository.requestCameraPermission();
  }

}