import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product_model.dart';
import '../repos/home_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.homeRepo) : super(AddProductInitial());
  final HomeRepo homeRepo;
  final List<ProductsModel> products=[];
  addOrRemoveProduct({required ProductsModel productModel}){
    final isSelected=products.contains(productModel);
    if(isSelected){
      products.remove(productModel);
    }else{
      products.add(productModel);
    }
    emit(AddProductloaded());
  }
 /*  fetchProducts()async{
    emit(GetProductsLoading());
  var result = await homeRepo.fetchProducts();
  result.fold(
    (failure) => emit(FailedToGetProducts(errMessage: failure.toString())),
    (products) => emit(GetProductsSuccess(products: products)),
  );
  } */
 /* fetchProducts() async {
  
  emit(GetProductsLoading()); // Emit the loading state before fetching categories

  var result = await homeRepo.fetchProducts();
  result.fold(
    (failure) => emit(FailedToGetProducts(errMessage: failure.toString())),
    (products) => emit(GetProductsSuccess(products: products)),
  );
} */
}
