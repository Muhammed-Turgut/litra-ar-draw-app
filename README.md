<h1 align="center">Litra: AR Draw</h1> 

---
<p>Kullanıcıların klavuz çizgiler ile daha rahat resim çimesini sağlayan mobil uygulama projesi.</p>

<h3>FEAT: Dosya Yapısı Oluşturuldu</h3>

---
<p>Dosya yapısında MVVM → SOLID → Clean Architecture yapıları ve prensipleri kullanıldı.
Uygulama Dart dili ile ve Flutter Framwork'ü kullanılarak geliştirildi. Aynı zamanda versiyon kotrol sistemi yapısı içinde git ve github kullanıldı.
Local veri tabanı için SQLite ve Remote veri tabanı için AppWrite kullanıldı.</p>
Bu düzeltilecek

```dart
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── network_info.dart
│   │   └── dio_client.dart
│   ├── utils/
│   │   ├── validators.dart
│   │   └── logger.dart
│   └── di/
│       └── injector.dart   // get_it singleton setup
│
├── features/
│   └── auth/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── auth_remote_datasource.dart
│       │   │   └── auth_local_datasource.dart
│       │   ├── models/
│       │   │   └── user_model.dart
│       │   └── repositories/
│       │       └── auth_repository_impl.dart
│       │
│       ├── domain/
│       │   ├── entities/
│       │   │   └── user.dart
│       │   ├── repositories/
│       │   │   └── auth_repository.dart
│       │   └── usecases/
│       │       └── login.dart
│       │
│       ├── presentation/
│       │   ├── viewmodels/
│       │   │   └── login_viewmodel.dart
│       │   ├── pages/
│       │   │   └── login_page.dart
│       │   └── widgets/
│       │       └── login_button.dart
│       │
│       └── auth_injection.dart
│
├── app/
│   ├── routes/
│   │   └── app_routes.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── app.dart
│
└── main.dart
```
