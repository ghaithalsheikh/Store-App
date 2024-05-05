part of 'get_items_categories_cubit.dart';

@immutable
sealed class GetItemsCategoriesState {}

final class GetItemsCategoriesInitial extends GetItemsCategoriesState {}

final class GetItemsCategoriesLoading extends GetItemsCategoriesState {}

final class GetItemsCategoriesLoaded extends GetItemsCategoriesState {
  final List<ProductModel> productCategories;

  GetItemsCategoriesLoaded({required this.productCategories});
}
