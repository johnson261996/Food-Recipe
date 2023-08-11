

import '../model/food_model.dart';
import '../util/apiProvider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<FoodModel> fetchFoodList() {
    return _provider.fetchFoodList();
  }


  Future<FoodModel> searchFoodList(String food) {
    return _provider.searchFoodList(food);
  }


}

class NetworkError extends Error {}