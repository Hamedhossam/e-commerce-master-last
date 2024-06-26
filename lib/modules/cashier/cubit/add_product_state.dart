part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class AddProductloaded extends AddProductState {}
/* final class GetProductsSuccess extends AddProductState {
  final List<ProductsModel>products;

  GetProductsSuccess({required this.products});
}
final class GetProductsLoading extends AddProductState {}
final class FailedToGetProducts extends AddProductState {
  final String errMessage;

  FailedToGetProducts({required this.errMessage});
} 
 */