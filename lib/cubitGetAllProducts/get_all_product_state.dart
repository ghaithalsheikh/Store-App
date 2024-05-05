part of 'get_all_product_cubit.dart';

@immutable
sealed class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}

final class GetAllProductLoaded extends GetAllProductState {
  final List<ProductModel> products;

  GetAllProductLoaded({required this.products});
}

final class GetAllProductLoading extends GetAllProductState {}
