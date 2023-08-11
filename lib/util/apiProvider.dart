
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/food_model.dart';



class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://www.themealdb.com/api/json/v1/1/search.php?f=c';
  final String _searchurl = "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  Future<FoodModel> fetchFoodList() async {
    try {
      Response response = await _dio.get(_url);
      debugPrint("food response:${response.data}");
      return FoodModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FoodModel.withError("Data not found / Connection issue");
    }
  }

  Future<FoodModel> searchFoodList(String food,) async {
    try {
      Response response = await _dio.get(_searchurl+food);
      debugPrint("search response:${response.data}");
      return FoodModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FoodModel.withError("Data not found / Connection issue");
    }
  }





}