part of 'favourite_items_cubit.dart';

@immutable
sealed class FavouriteItemsState {}

final class FavouriteItemsInitial extends FavouriteItemsState {}

final class FavouriteItemsAdd extends FavouriteItemsState {
  final List<ProductModel> favouriteProduct;

  FavouriteItemsAdd({required this.favouriteProduct});
}

final class FavouriteItemsRemove extends FavouriteItemsState {
  final List<ProductModel>? favouriteProduct;

  FavouriteItemsRemove({required this.favouriteProduct});
}
