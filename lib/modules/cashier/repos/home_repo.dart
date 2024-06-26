import 'package:dartz/dartz.dart';

import '../models/product_model.dart';

abstract class HomeRepo{
  Future<Either<Error,List<HomeModel>>>fetchCategories();
   // Future<Either<Error,List<ProductsModel>>>fetchProducts();

}