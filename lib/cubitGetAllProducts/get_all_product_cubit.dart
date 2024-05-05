import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit() : super(GetAllProductInitial());

  Future<void> getAllProducts() async {
    emit(GetAllProductLoading());
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    emit(GetAllProductLoaded(products: productList));
  }
}
