import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/product_model.dart';
import '../../repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepoImplement) : super(CategoriesInitial());
  final HomeRepo homeRepoImplement;
 fetchCategories() async {
  
  emit(CategoriesLoading()); // Emit the loading state before fetching categories

  var result = await homeRepoImplement.fetchCategories();
  result.fold(
    (failure) => emit(FailedToGetCategories(errMessage: failure.toString())),
    (categories) => emit(CategoriesSuccess(categories: categories)),
  );
}
}
