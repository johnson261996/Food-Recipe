import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/food_model.dart';
import '../repository/apiRepository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final ApiRepository _apiRepository = ApiRepository();

  FoodBloc() : super(FoodInitial()) {
    on<FoodEvent>((event, emit)async {
      try {
        emit(FoodLoading());
        final mList = await _apiRepository.fetchFoodList();
        emit(FoodLoaded(mList));
        if (mList.error != null) {
          emit(FoodError(mList.error));
        }
      } on NetworkError {
        emit(FoodError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
