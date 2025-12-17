import 'dart:ffi';

class CategoryEntity {
  //Bu gelecek olan postların tipini tutyor.
  int order;
  String category;
  String imageUrl;
  bool isActive;
  String type;

  CategoryEntity({
    required this.order,
    required this.category,
    required this.imageUrl,
    required this.isActive,
    required this.type
  });

}