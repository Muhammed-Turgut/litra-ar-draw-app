import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:litra_ar_draw_app/data/models/category_item_model.dart';

class MockContentDatasource {
  List<CategoryItemModel>? _cachedCategoryItems;
  static const int _pageSize = 10;
 
  Future<List<CategoryItemModel>> _loadCategoryItems() async {
    
    if(_cachedCategoryItems != null) return _cachedCategoryItems!;
    
    final jsonString = await rootBundle.loadString('assets/mock/category_items.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    _cachedCategoryItems = jsonList.map((e) =>
        CategoryItemModel.fromJson(e)).toList();

    return _cachedCategoryItems!;
    
  }
  
  Future<List<CategoryItemModel>> getCategoryItem({int page = 1, String category = "vehicles"}) async {
    final all = await _loadCategoryItems();

    final categoryList = all.where((t) => t.category == category).toList();

    final startIndex = (page -1)* _pageSize;

    if(startIndex >= categoryList.length) return [];

    final endIndex = (startIndex + _pageSize).clamp(0, categoryList.length);

    return categoryList.sublist(startIndex,endIndex);
  }

}