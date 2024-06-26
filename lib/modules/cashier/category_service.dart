import 'package:dio/dio.dart';

class CategoryService{
  final Dio dio;

  CategoryService({required this.dio});

  getCategories()async{
    var response=await dio.get('https://scmapi.runasp.net/api/Canteen/Categories');
    var data=response.data;
    return data;
  }
}