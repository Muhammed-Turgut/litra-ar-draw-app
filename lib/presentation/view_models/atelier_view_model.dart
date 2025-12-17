import 'package:flutter/cupertino.dart';
import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';
import 'package:litra_ar_draw_app/domain/usecase/get_content_item_use_case.dart';

class AtelierViewModel extends ChangeNotifier {
  final GetContentItemUseCase getContentItemUseCase;

  AtelierViewModel({required this.getContentItemUseCase});

  // Lists
  List<CategoryEntity> _basicList = [];
  List<CategoryEntity> get basicList => _basicList;

  List<CategoryEntity> _animeList = [];
  List<CategoryEntity> get animeList => _animeList;

  List<CategoryEntity> _animalsList = [];
  List<CategoryEntity> get animalsList => _animalsList;

  List<CategoryEntity> _buildingList = [];
  List<CategoryEntity> get buildingList => _buildingList;

  List<CategoryEntity> _peoplesList = [];
  List<CategoryEntity> get peoplesList => _peoplesList;

  List<CategoryEntity> _cartoonList = [];
  List<CategoryEntity> get cartoonList => _cartoonList;

  List<CategoryEntity> _fashionList = [];
  List<CategoryEntity> get fashionList => _fashionList;

  List<CategoryEntity> _fantasyList = [];
  List<CategoryEntity> get fantasyList => _fantasyList;

  List<CategoryEntity> _natureList = [];
  List<CategoryEntity> get natureList => _natureList;

  List<CategoryEntity> _vehiclesList = [];
  List<CategoryEntity> get vehiclesList => _vehiclesList;

  // API'den kategori verisi çeker
  Future<void> getCategoryItem(String category) async {
    final result = await getContentItemUseCase.getCategoryItem(category);

    switch (category) {
      case "animal":
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
  List<CategoryEntity> getCategoryList(String category) {
    switch (category) {
      case "animal":
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
