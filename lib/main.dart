import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litra_ar_draw_app/core/router/app_router.dart';
import 'package:litra_ar_draw_app/data/repositories/camera_repository_impl.dart';
import 'package:litra_ar_draw_app/data/repositories/content_repository_impl.dart';
import 'package:litra_ar_draw_app/data/repositories/request_permission_repository_impl.dart';
import 'package:litra_ar_draw_app/deneme.dart';
import 'package:litra_ar_draw_app/domain/usecase/camera_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_content_item_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_post_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/login_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/pick_image_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/request_gallery_permission_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/share_post_use_case.dart';
import 'package:litra_ar_draw_app/firebase_options.dart';
import 'package:litra_ar_draw_app/presentation/providers/camera_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/category_item_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/explore_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/login_providers.dart';
import 'package:litra_ar_draw_app/presentation/view_models/atelier_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/camera_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/explore_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/login_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/signin_view_model.dart';
import 'package:provider/provider.dart';
import 'data/repositories/FirebaseAuthRepository.dart';
import 'data/repositories/post_repository_impl.dart';
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



  /// 2. Firebase bağlantısını başlatır !!! şimdilik kalıcak
  ///
  ///------------Fierbase------------
  /// 1. Gerekli bağlamayı sağlar (Firebase'den önce mutlaka olmalı)
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
   MultiProvider(
     //Burda Providere widget ağacına enjecte etik.
     providers:[
       ...loginProviders,
       ...cameraProviders,
       ...exploreProviders,
       ...mainProviders
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