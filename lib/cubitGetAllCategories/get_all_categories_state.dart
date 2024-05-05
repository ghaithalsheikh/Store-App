part of 'get_all_categories_cubit.dart';

@immutable
sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesLoaded extends GetAllCategoriesState {
  final List<dynamic> categories;

  GetAllCategoriesLoaded({required this.categories});
}
