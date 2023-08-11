part of 'food_bloc.dart';

@immutable
abstract class FoodState {

  const FoodState();

  @override
  List<Object?> get props => [];

}

class FoodInitial extends FoodState {


}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final FoodModel foodModel;
  const FoodLoaded(this.foodModel);

  @override
  List<Object> get props => [];
}

class FoodError extends FoodState {
  final String? message;
  const FoodError(this.message);
}
