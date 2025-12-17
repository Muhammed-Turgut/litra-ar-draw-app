import 'package:litra_ar_draw_app/data/repositories/content_repository.dart';
import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';

class GetContentItemUseCase{
  final ContentRepository contentRepository;

  GetContentItemUseCase({required this.contentRepository});

  Future<List<CategoryEntity>> getCategoryItem(String category) async {
    return contentRepository.getCategoryItem(category);
  }


}