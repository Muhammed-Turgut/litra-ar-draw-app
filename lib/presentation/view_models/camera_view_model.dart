
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:litra_ar_draw_app/domain/usecase/camera_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/request_camera_permission_use_case.dart';
import 'package:litra_ar_draw_app/main.dart';

import '../enums/camera_permission_status.dart';

class CameraViewModel extends ChangeNotifier{

  final CameraUseCase cameraUseCase;
  final RequestCameraPermissionUseCase requestCameraPermissionUseCase;

  CameraViewModel({
    required this.requestCameraPermissionUseCase,
    required this.cameraUseCase
  });

  bool _navigationHandled = false;

  CameraController? _controller;
  int _selectedCameraIndex = 0;

  CameraController? get controller => _controller;

  CameraPermissionStatus _permissionStatus = CameraPermissionStatus.initial;
  CameraPermissionStatus get permissionStatus => _permissionStatus;


  bool get isInitialized => _controller?.value.isInitialized ?? false;

  Future<void> initCamera() async {
    print('=== initCamera başladı ===');

    final granted = await requestCameraPermissionUseCase.requestCameraPermission();
    print('=== izin: $granted ===');

    _permissionStatus = granted
        ? CameraPermissionStatus.granted
        : CameraPermissionStatus.denied;

    if (_permissionStatus == CameraPermissionStatus.granted) {
      _controller = await cameraUseCase.initializedCamera(_selectedCameraIndex);
      print('=== controller: $_controller ===');
      print('=== isInitialized: ${_controller?.value.isInitialized} ===');
    }

    notifyListeners();
  }

  void resetPermissionStatus() {
    _permissionStatus = CameraPermissionStatus.initial;
  }

  set permissionStatus(CameraPermissionStatus value) {
    _permissionStatus = value;
  }

  Future<void> switchCamera() async{

    if(_controller == null) return;
    await cameraUseCase.disposeCamera(_controller!);

    _selectedCameraIndex = (_selectedCameraIndex+1)%cameras.length;

    _controller =
         await cameraUseCase.initializedCamera(_selectedCameraIndex);

  }

  Future<void> takePicture() async {
    if(_controller == null) return;
    await cameraUseCase.takePicture(_controller!);
  }

  @override
  void dispose() {
    if(_controller != null){
      cameraUseCase.disposeCamera(_controller!);
    }
    super.dispose();
  }

}

