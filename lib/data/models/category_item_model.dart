import 'package:litra_ar_draw_app/domain/entities/category_items_entity.dart';

class CategoryItemModel {

  final int id;
  final String category;
  final String imageUrl;
  final String type;

  const CategoryItemModel({
    required this.id,
    required this.imageUrl,
    required this.category,
    required this.type
  });

  CategoryItemEntity toEntity(){
    return CategoryItemEntity(
        id: id,
        category: category,
        imageUrl: imageUrl,
        type: type);
  }

  factory CategoryItemModel.fromJson(Map<String, dynamic> json){
    return CategoryItemModel(
        id: json['id'] is String ? int.parse(json['id']) : (json['id'] as num).toInt(),
        imageUrl: json['url'] ?? '',
        category: json['category'] ?? '',
        type: json['isActive'] ?? ''
    );
  }

  factory CategoryItemModel.fromEntity(CategoryItemEntity entity){
    return CategoryItemModel(
        id: entity.id,
        imageUrl: entity.imageUrl,
        category: entity.category,
        type: entity.type
    );
  }

}