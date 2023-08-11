import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/food_model.dart';
import '../repository/apiRepository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final ApiRepository _apiRepository = ApiRepository();

  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async{
      try {
        emit(SearchLoading());
        final mList = await _apiRepository.searchFoodList(event.food);
        emit(SearchLoaded(mList));
        if (mList.error != null) {
          emit(SearchError(mList.error));
        }
      } on NetworkError {
        emit(SearchError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
