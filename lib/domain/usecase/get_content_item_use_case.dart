import 'package:litra_ar_draw_app/data/repositories/content_repository_impl.dart';
import 'package:litra_ar_draw_app/domain/entities/category_items_entity.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_content_repository.dart';

class GetContentItemUseCase{
  final UseContentRepository contentRepository;

  GetContentItemUseCase({required this.contentRepository});

  Future<List<CategoryItemEntity>> getCategoryItem(String category) async {
    return contentRepository.getCategoryItem(category);
  }


}