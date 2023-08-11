part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent(this.food);
  final String food;

  @override
  List<Object> get props => [food];
}

class SearchFoodList extends SearchEvent {
  const SearchFoodList(super.food);

}


