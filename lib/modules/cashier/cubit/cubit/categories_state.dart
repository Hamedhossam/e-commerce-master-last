part of 'categories_cubit.dart';

@immutable
@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<HomeModel> categories;

  CategoriesSuccess({required this.categories});
}

class FailedToGetCategories extends CategoriesState {
  final String errMessage;

  FailedToGetCategories({required this.errMessage});
}
