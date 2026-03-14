import 'package:litra_ar_draw_app/domain/entities/users_post_item.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_post_repository.dart';

class GetPostUseCase {
  final UsePostRepository postRepository;
  GetPostUseCase({required this.postRepository});

  Future<List<UsersPostItem>> getPostsList() async{
    return postRepository.getPostList();
  }
}