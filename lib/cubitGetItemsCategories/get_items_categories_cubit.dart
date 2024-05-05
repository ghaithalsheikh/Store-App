import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

part 'get_items_categories_state.dart';

class GetItemsCategoriesCubit extends Cubit<GetItemsCategoriesState> {
  GetItemsCategoriesCubit() : super(GetItemsCategoriesInitial());

  Future<void> getcategoriesProduct({required String categoryName}) async {
    emit(GetItemsCategoriesLoading());
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productListItemsCategories = [];
    for (int i = 0; i < data.length; i++) {
      productListItemsCategories.add(ProductModel.fromJson(data[i]));
    }
    emit(GetItemsCategoriesLoaded(
        productCategories: productListItemsCategories));
  }
}
