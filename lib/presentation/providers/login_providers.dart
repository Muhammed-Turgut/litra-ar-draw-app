import 'package:litra_ar_draw_app/data/repositories/FirebaseAuthRepository.dart';
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/login_user_use_case.dart';
import 'package:litra_ar_draw_app/domain/usecase/register_user_use_case.dart';
import 'package:litra_ar_draw_app/presentation/view_models/login_view_model.dart';
import 'package:litra_ar_draw_app/presentation/view_models/signin_view_model.dart';
import 'package:provider/provider.dart';

final loginProviders = [

  Provider<GetUserUseCase>(
    create: (context) => GetUserUseCase(
      firebaseAuthRepository: context.read<AuthRepository>(), // ✅ Düzeltildi
    ),
  ),

  Provider<AuthRepository>(create: (context) => FirebaseAuthRepository()),

  Provider<LoginUserUseCase>(create: (context) =>
      LoginUserUseCase(authRepository: context.read<AuthRepository>())),

  Provider<RegisterUserUseCase>(create: (context) =>
      RegisterUserUseCase(authRepository: context.read<AuthRepository>())
  ),

  ChangeNotifierProvider<LoginViewModel>(create: (context) =>
  LoginViewModel(loginUserUseCase: context.read<LoginUserUseCase>())
  ),

  ChangeNotifierProvider<SigInViewModel>(create: (context) =>
      SigInViewModel(registerUserUseCase: context.read<RegisterUserUseCase>())
  )

];
