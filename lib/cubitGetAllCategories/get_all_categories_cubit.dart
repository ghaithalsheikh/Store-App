import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/helper/api.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit() : super(GetAllCategoriesInitial());

  Future<void> getallcategories() async {
    List<dynamic> categories =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    emit(GetAllCategoriesLoaded(categories: categories));
  }
}
