class AppError{


  String errorType(String code) {
    switch (code) {
      case 'invalid-email':
      case 'auth/invalid-email':
        return "Geçersiz e-posta formatı.";

      case 'email-already-exists':
      case 'auth/email-already-exists':
      case 'email-already-in-use':
      case 'auth/email-already-in-use':
        return "Bu e-posta adresi zaten kullanılmakta.";

      case 'wrong-password':
      case 'auth/wrong-password':
      case 'user-not-found':
      case 'auth/user-not-found':
      case 'invalid-credential':
        return "Geçersiz e-posta veya şifre.";

      case 'requires-recent-login':
      case 'auth/requires-recent-login':
        return "Güvenlik nedeniyle işlem reddedildi. Lütfen tekrar giriş yapın.";

      case 'too-many-requests':
      case 'auth/too-many-requests':
        return "Çok fazla deneme yapıldı, lütfen biraz bekleyin.";

      case 'auth/user-disabled':
        return "Bu hesap bir yönetici tarafından devre dışı bırakılmış.";

      case 'auth/id-token-expired':
      case 'auth/session-cookie-expired':
        return "Oturumunuzun süresi doldu, lütfen tekrar giriş yapın.";

      case 'auth/invalid-verification-code':
        return "Geçersiz doğrulama kodu.";

      case 'auth/invalid-phone-number':
        return "Geçersiz telefon numarası.";

      case 'auth/phone-number-already-exists':
        return "Bu telefon numarası zaten kullanımda.";

      case 'auth/operation-not-allowed':
        return "Bu oturum açma yöntemi devre dışı.";

      case 'auth/network-request-failed':
        return "Ağ hatası! İnternet bağlantınızı kontrol edin.";

      default:
        return "Bir hata oluştu. Lütfen tekrar deneyin.";
    }
  }


}
