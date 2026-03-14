import 'package:litra_ar_draw_app/domain/entities/category_items_entity.dart';

abstract class UseContentRepository {

  Future<List<CategoryItemEntity>> getCategoryItem(String category);

}