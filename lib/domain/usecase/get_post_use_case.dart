import 'package:litra_ar_draw_app/data/repositories/post_repository.dart';
import 'package:litra_ar_draw_app/domain/entitys/users_post_item.dart';

class GetPostUseCase {
  final PostRepository postRepository;
  GetPostUseCase({required this.postRepository});

  Future<List<UsersPostItem>> getPostsList() async{
    return postRepository.getPostList();
  }
}