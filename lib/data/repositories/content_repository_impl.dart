import 'package:litra_ar_draw_app/data/datasource/local/mock_content_datasource.dart';
import 'package:litra_ar_draw_app/domain/entities/category_items_entity.dart';
import 'package:litra_ar_draw_app/domain/repositories/use_content_repository.dart';

class ContentRepositoryImpl implements UseContentRepository {
  final MockContentDatasource datasource;
  ContentRepositoryImpl({required this.datasource});


  @override
  Future<List<CategoryItemEntity>> getCategoryItem(String category, {int page =1}) async {
         final models = await datasource.getCategoryItem(page: page, category: category);
         return models.map((model) => model.toEntity()).toList();
  }

}
