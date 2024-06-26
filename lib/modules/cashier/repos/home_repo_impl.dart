import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../category_service.dart';
import '../models/product_model.dart';
import 'home_repo.dart';

class HomeRepoImplement implements HomeRepo {
  CategoryService categoryService = CategoryService(dio: Dio());
  List<HomeModel> categories = [];
  List<ProductsModel> products = [];

 fetchCategories() async {
    categories.clear();
    try {
      var data = await categoryService.getCategories();
      for (var i in data) {
        categories.add(HomeModel.fromJson(i));
      }
      return right(categories);
    } catch (e) {
      return left(e.toString()as Error);
    }
  }

  /*  fetchProducts() async {
    products.clear();
    try {
      for (var category in categories) {
        for (var product in category.products ?? []) {
          products.add(product);
        }
      }
      return right(products);
    } catch (e) {
      return left(e.toString() as Error);
    }
  } */
 /*   @override
     fetchProducts() async {
    products.clear();
    try {
    var data = await categoryService.getCategories();

      for (var i in data) {
       
          products.add(ProductsModel.fromJson(i['products']));
        
      }
      return right(products);
    } catch (e) {
      return left(e.toString() as Error);
    }
  } */
}