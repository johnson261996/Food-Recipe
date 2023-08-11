part of 'search_bloc.dart';

@immutable
abstract class SearchState {

  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class  SearchLoading extends  SearchState {}

class  SearchLoaded extends  SearchState {
  final FoodModel searchModel;
  const SearchLoaded(this.searchModel);

  @override
  List<Object> get props => [];
}

class  SearchError extends  SearchState {
  final String? message;
  const  SearchError(this.message);
}