part of 'food_bloc.dart';

@immutable
abstract class FoodEvent {

  const FoodEvent();

  @override
  List<Object> get props => [];
}

class GetFoodList extends FoodEvent {}
