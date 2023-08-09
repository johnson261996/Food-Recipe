

import '../model/food_model.dart';
import '../util/apiProvider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<FoodModel> fetchFoodList() {
    return _provider.fetchFoodList();
  }
}

class NetworkError extends Error {}