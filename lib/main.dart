import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litra_ar_draw_app/core/router/app_router.dart';
import 'package:litra_ar_draw_app/data/repositories/camera_repository.dart';
import 'package:litra_ar_draw_app/domain/usecase/camera_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/login_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/pick_image_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/share_post_use_case.dart';
import 'package:litra_ar_draw_app/firebase_options.dart';
import 'package:litra_ar_draw_app/presentation/view_models/camera_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/explore_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/login_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/signin_view_model.dart';
import 'package:provider/provider.dart';
import 'data/repositories/FirebaseAuthRepository.dart';
import 'data/repositories/post_repository.dart';
import 'domain/usecase/register_user_use_case.dart';
import 'domain/usecase/request_camera_permission_use_case.dart' show RequestCameraPermissionUseCase;

List<CameraDescription> cameras = [];

void main() async {

  ///Uygulamanın sadece dikey moda kullanılmasını sağlamak için ekranı dikey moda kitledim.
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ///---------------------------------------

  ///------------Fierbase------------
  /// 1. Gerekli bağlamayı sağlar (Firebase'den önce mutlaka olmalı)
  WidgetsFlutterBinding.ensureInitialized();

  /// 2. Firebase bağlantısını başlatır
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ///-----------------------

  ///------Camera------///
  cameras = await availableCameras();
  final cameraRepository = CameraRepository();
  final cameraUseCase = CameraUseCase( cameraRepository: cameraRepository);
  final requestCameraPermissionUseCase = RequestCameraPermissionUseCase(cameraRepository: cameraRepository);

  ///Otur işlmelrinin use caseleri
  final authRepository = FirebaseAuthRepository();
  final registerUserUseCase = RegisterUserUseCase(authRepository);
  final loginUserUseCase = LoginUserUseCase(repository: authRepository);
  final getUserUseCase = GetUserUseCase(firebaseAuthRepository: authRepository);

  final postRepository = PostRepository();
  final pickImageUseCase = PickImageUseCase(postRepository: postRepository);
  final sharePostUseCase = SharePostUseCase(postRepository: postRepository);


  runApp(
   MultiProvider(
     //Burda Providere widget ağacına enjecte etik.
     providers:[
        ChangeNotifierProvider(create: (_) => SigInViewModel(registerUserUseCase: registerUserUseCase)),
        ChangeNotifierProvider(create: (_) => LoginViewModel(loginUserUseCase: loginUserUseCase)),
        ChangeNotifierProvider(create: (_) => CameraViewModel(cameraUseCase: cameraUseCase)),
       ChangeNotifierProvider(create: (_) => ExploreViewModel(
           requestCameraPermissionUseCase: requestCameraPermissionUseCase,
           getUserUseCase: getUserUseCase,
           pickImageUseCase: pickImageUseCase,
           sharePostUseCase: sharePostUseCase)
       )
     ],
     child:MyApp()
   ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}