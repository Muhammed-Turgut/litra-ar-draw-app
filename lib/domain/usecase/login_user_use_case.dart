
import 'package:firebase_auth/firebase_auth.dart';
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';

class LoginUserUseCase{
  final AuthRepository authRepository;
  LoginUserUseCase({required this.authRepository});

  Future<void> login({
    required String email,
    required String password,
  }) async {
    // Örnek iş mantığı: boş alan kontrolü
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Tüm alanları doldurun");
    }

    if (password.length <= 8) {
      throw Exception("Şifre en az 8 karakter olmalı");
    }

    // Repository'yi çağır
    await authRepository.loginUser(email: email, password: password);
  }

  //şifreyi sıfırlama işlemleri
  Future<void> resetPassword({required String email}) async{
    if(email.isEmpty){
      throw Exception("Tüm alanları doldurun");
    }
    await authRepository.resetPassword(email: email);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Google ile kayıt olduktan sonra Firestore'a kullanıcı bilgilerini kaydet
    return await authRepository.signInWithGoogle();
  }

}