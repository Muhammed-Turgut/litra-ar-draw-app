import 'package:litra_ar_draw_app/data/repositories/FirebaseAuthRepository.dart';
import 'package:litra_ar_draw_app/data/repositories/post_repository_impl.dart';
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_post_repository.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_request_permission_repository.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_post_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/pick_image_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/request_camera_permission_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/share_post_use_case.dart';
import 'package:litra_ar_draw_app/presentation/view_models/explore_view_model.dart';
import 'package:provider/provider.dart';

final exploreProviders = [

  Provider<UsePostRepository>(
    create: (_) => PostRepositoryImpl(),
  ),

  Provider<RequestCameraPermissionUseCase>(
    create: (context) => RequestCameraPermissionUseCase(
      requestPermissionRepository: context.read<UseRequestPermissionRepository>(),
    ),
  ),

  Provider<GetUserUseCase>(
    create: (context) => GetUserUseCase(
      firebaseAuthRepository: context.read<AuthRepository>(), // ✅
    ),
  ),


  Provider<PickImageUseCase>(
    create: (context) => PickImageUseCase(
      postRepository: context.read<UsePostRepository>(), // ✅ Düzeltildi
    ),
  ),

  Provider<SharePostUseCase>(
    create: (context) => SharePostUseCase(
      postRepository: context.read<UsePostRepository>(), // ✅ Düzeltildi
    ),
  ),

  Provider<GetPostUseCase>(
    create: (context) => GetPostUseCase(
      postRepository: context.read<UsePostRepository>(), // ✅ Düzeltildi
    ),
  ),

  ChangeNotifierProvider<ExploreViewModel>(
    create: (context) => ExploreViewModel(
      requestCameraPermissionUseCase: context.read<RequestCameraPermissionUseCase>(),
      sharePostUseCase: context.read<SharePostUseCase>(),
      pickImageUseCase: context.read<PickImageUseCase>(),
      getUserUseCase: context.read<GetUserUseCase>(),
      getPostUseCase: context.read<GetPostUseCase>(),
    ),
  ),

];