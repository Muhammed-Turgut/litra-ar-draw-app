
class UserEntity{
  final String uid;
  final String? fullName;
  final List<String>? postsId;
  final String email;
  final String? createdAt;

  UserEntity({
    this.createdAt,
    required this.uid,
    this.postsId,
    this.fullName,
    required this.email,
  });
}