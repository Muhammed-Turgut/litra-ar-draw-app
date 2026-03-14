import 'dart:ffi';

import 'package:equatable/equatable.dart';

class CategoryItemEntity extends Equatable{
  //Bu gelecek olan postların tipini tutyor.
  final int id;
  final String category;
  final String imageUrl;
  final String type;

  const CategoryItemEntity({
    required this.id,
    required this.category,
    required this.imageUrl,
    required this.type,
  });

  @override
  List<Object?> get props =>[
    id,
    category,
    imageUrl,
    type
  ];

}