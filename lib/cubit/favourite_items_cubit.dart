import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/models/product_model.dart';

part 'favourite_items_state.dart';

class FavouriteItemsCubit extends Cubit<FavouriteItemsState> {
  FavouriteItemsCubit() : super(FavouriteItemsInitial());

  List<ProductModel> favouriteItems = [];
  void addItemToFaourite(ProductModel productModel) {
    favouriteItems.add(productModel);
    emit(FavouriteItemsAdd(favouriteProduct: favouriteItems));
  }

  void removeItemToFaourite(ProductModel productModel) {
    favouriteItems.removeWhere((item) => item == productModel);
    emit(FavouriteItemsRemove(favouriteProduct: favouriteItems));
  }
}
