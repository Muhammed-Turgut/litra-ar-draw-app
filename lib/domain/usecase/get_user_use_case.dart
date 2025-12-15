import 'package:litra_ar_draw_app/data/repositories/FirebaseAuthRepository.dart';
import 'package:litra_ar_draw_app/domain/entitys/user_entity.dart';

class GetUserUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  GetUserUseCase({required this.firebaseAuthRepository});

  Future<UserEntity> getUser() async{
    //Kullanıcıyı getiren fonksiyon.
      return firebaseAuthRepository.getUser();
  }
}