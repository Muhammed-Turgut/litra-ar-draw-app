
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';

class LoginUserUseCase{
  final AuthRepository repository;
  LoginUserUseCase({required this.repository});

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
    await repository.loginUser(email: email, password: password);
  }

  //şifreyi sıfırlama işlemleri
  Future<void> resetPassword({required String email}) async{
    if(email.isEmpty){
      throw Exception("Tüm alanları doldurun");
    }
    await repository.resetPassword(email: email);
  }

  Future<void> signInWithGoogle() async {
    // Google ile kayıt olduktan sonra Firestore'a kullanıcı bilgilerini kaydet
    repository.signInWithGoogle();
  }

}