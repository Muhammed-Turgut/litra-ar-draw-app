import 'package:flutter/cupertino.dart';
import 'package:litra_ar_draw_app/domain/entities/category_items_entity.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_content_item_use_case.dart';

class AtelierViewModel extends ChangeNotifier {
  final GetContentItemUseCase getContentItemUseCase;

  AtelierViewModel({required this.getContentItemUseCase});

  // Lists
  List<CategoryItemEntity> _basicList = [];
  List<CategoryItemEntity> get basicList => _basicList;

  List<CategoryItemEntity> _animeList = [];
  List<CategoryItemEntity> get animeList => _animeList;

  List<CategoryItemEntity> _animalsList = [];
  List<CategoryItemEntity> get animalsList => _animalsList;

  List<CategoryItemEntity> _buildingList = [];
  List<CategoryItemEntity> get buildingList => _buildingList;

  List<CategoryItemEntity> _peoplesList = [];
  List<CategoryItemEntity> get peoplesList => _peoplesList;

  List<CategoryItemEntity> _cartoonList = [];
  List<CategoryItemEntity> get cartoonList => _cartoonList;

  List<CategoryItemEntity> _fashionList = [];
  List<CategoryItemEntity> get fashionList => _fashionList;

  List<CategoryItemEntity> _fantasyList = [];
  List<CategoryItemEntity> get fantasyList => _fantasyList;

  List<CategoryItemEntity> _natureList = [];
  List<CategoryItemEntity> get natureList => _natureList;

  List<CategoryItemEntity> _vehiclesList = [];
  List<CategoryItemEntity> get vehiclesList => _vehiclesList;

  // API'den kategori verisi çeker
  Future<void> getCategoryItem(String category) async {
    final result = await getContentItemUseCase.getCategoryItem(category);

    switch (category) {
      case "animals":
        _animalsList = result;
        break;
      case "nature":
        _natureList = result;
        break;
      case "vehicles":
        _vehiclesList = result;
        break;
      case "buildings":
        _buildingList = result;
        break;
      case "people":
        _peoplesList = result;
        break;
      case "fashion":
        _fashionList = result;
        break;
      case "anime":
        _animeList = result;
        break;
      case "cartoons":
        _cartoonList = result;
        break;
      case "fantasy":
        _fantasyList = result;
        break;
    }

    notifyListeners();
  }

  // Bellekteki kategori listesini döndürür
  List<CategoryItemEntity> getCategoryList(String category) {
    switch (category) {
      case "animals":
        return _animalsList;
      case "nature":
        return _natureList;
      case "vehicles":
        return _vehiclesList;
      case "buildings":
        return _buildingList;
      case "people":
        return _peoplesList;
      case "fashion":
        return _fashionList;
      case "anime":
        return _animeList;
      case "cartoons":
        return _cartoonList;
      case "fantasy":
        return _fantasyList;
      default:
        return [];
    }
  }
}
