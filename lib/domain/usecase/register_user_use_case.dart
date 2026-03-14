import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';

class RegisterUserUseCase {
  final AuthRepository authRepository;

  RegisterUserUseCase({ required this.authRepository});

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    // Örnek iş mantığı: boş alan kontrolü
    if (email.isEmpty || password.isEmpty || fullName.isEmpty) {
      throw Exception("Tüm alanları doldurun");
    }

    if (password.length < 6) {
      throw Exception("Şifre en az 6 karakter olmalı");
    }

    // Repository'yi çağır
    await authRepository.registerUser(email: email, password: password, fullName: fullName);
  }
}