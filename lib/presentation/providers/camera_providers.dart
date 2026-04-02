import 'package:flutter/cupertino.dart';
import 'package:litra_ar_draw_app/data/repositories/camera_repository_impl.dart';
import 'package:litra_ar_draw_app/data/repositories/request_permission_repository_impl.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_camera_repository.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_request_permission_repository.dart';
import 'package:litra_ar_draw_app/domain/usecase/camera_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/request_camera_permission_use_case.dart';
import 'package:litra_ar_draw_app/presentation/view_models/camera_view_model.dart';
import 'package:provider/provider.dart';

final cameraProviders = [

  Provider<UseCameraRepository>(
    create: (context) => CameraRepositoryImpl(),
  ),

  Provider<UseRequestPermissionRepository>(
    create: (context) => RequestPermissionRepositoryImpl(),
  ),

  ProxyProvider<UseCameraRepository, CameraUseCase>(
    update: (context, cameraRepo, previous) =>
        CameraUseCase(cameraRepository: cameraRepo),
  ),

  ProxyProvider<UseRequestPermissionRepository, RequestCameraPermissionUseCase>(
    update: (context, permissionRepo, previous) =>
        RequestCameraPermissionUseCase(requestPermissionRepository: permissionRepo),
  ),

  ChangeNotifierProxyProvider2<RequestCameraPermissionUseCase, CameraUseCase, CameraViewModel>(
    create: (context) => CameraViewModel(
      requestCameraPermissionUseCase: context.read<RequestCameraPermissionUseCase>(),
      cameraUseCase: context.read<CameraUseCase>(),
    ),
    update: (context, permissionUseCase, cameraUseCase, previous) =>
        CameraViewModel(
          requestCameraPermissionUseCase: permissionUseCase,
          cameraUseCase: cameraUseCase,
        ),
  ),

];