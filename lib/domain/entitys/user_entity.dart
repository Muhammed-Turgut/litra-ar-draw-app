
class UserEntity{
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String createDate;

  UserEntity(this.createDate,
    {
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
  });
}