import 'package:litra_ar_draw_app/data/repositories/FirebaseAuthRepository.dart';
import 'package:litra_ar_draw_app/domain/entities/user_entity.dart';
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';


class GetUserUseCase {
  final AuthRepository firebaseAuthRepository;

  GetUserUseCase({required this.firebaseAuthRepository});

  Future<UserEntity> getUser() async{
    //Kullanıcıyı getiren fonksiyon.
      return firebaseAuthRepository.getUser();
  }
}