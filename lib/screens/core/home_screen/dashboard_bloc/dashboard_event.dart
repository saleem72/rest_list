// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardGetData extends DashboardEvent {}

class DashboardSetActiveRestaurant extends DashboardEvent {
  final Restaurant restaurant;

  const DashboardSetActiveRestaurant({required this.restaurant});

  @override
  List<Object> get props => [restaurant];
}

class DashBoardSetActiveCategory extends DashboardEvent {
  final ProductCategory category;

  const DashBoardSetActiveCategory({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}

class DashBoardSetActiveSubCategory extends DashboardEvent {
  final ProductCategory category;

  const DashBoardSetActiveSubCategory({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}

class DashboardGetProductForCategory extends DashboardEvent {
  final int restaurantId;
  final int categoryId;
  final int page;
  final int perPage;

  const DashboardGetProductForCategory({
    required this.restaurantId,
    required this.categoryId,
    required this.page,
    required this.perPage,
  });

  @override
  List<Object> get props => [restaurantId, categoryId, page, perPage];
}

class DashboardSetActiveProduct extends DashboardEvent {
  final Product product;
  const DashboardSetActiveProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class DashboardClearError extends DashboardEvent {}
