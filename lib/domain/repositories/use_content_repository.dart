import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';

abstract class UseContentRepository {

  Future<List<CategoryEntity>> getCategoryItem(String category);

}