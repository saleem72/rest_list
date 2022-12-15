part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.user,
    this.isLoading = false,
    this.activeRestaurant,
    this.failure,
    this.categories = const [],
    this.activeCatgory,
    this.activeSubCatgory,
    this.products = const [],
    this.activeProduct,
  });

  final LoginUser? user;
  final bool isLoading;
  final Restaurant? activeRestaurant;
  final Failure? failure;
  final List<ProductCategory> categories;
  final ProductCategory? activeCatgory;
  final ProductCategory? activeSubCatgory;
  final List<Product> products;
  final Product? activeProduct;
  @override
  List<Object?> get props => [
        user,
        activeRestaurant,
        failure,
        isLoading,
        categories,
        activeCatgory,
        activeSubCatgory,
        products,
        activeProduct,
      ];

  DashboardState copyWith({
    LoginUser? user,
    bool? isLoading,
    Restaurant? activeRestaurant,
    Failure? failure,
    List<ProductCategory>? categories,
    ProductCategory? activeCatgory,
    ProductCategory? activeSubCatgory,
    List<Product>? products,
    Product? activeProduct,
  }) {
    return DashboardState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      activeRestaurant: activeRestaurant ?? this.activeRestaurant,
      failure: failure ?? this.failure,
      categories: categories ?? this.categories,
      activeCatgory: activeCatgory ?? this.activeCatgory,
      activeSubCatgory: activeSubCatgory ?? this.activeSubCatgory,
      products: products ?? this.products,
      activeProduct: activeProduct ?? this.activeProduct,
    );
  }

  DashboardState clearError() {
    return DashboardState(
      user: user,
      isLoading: isLoading,
      activeRestaurant: activeRestaurant,
      failure: null,
      categories: categories,
      activeCatgory: activeCatgory,
      activeSubCatgory: activeSubCatgory,
      products: products,
      activeProduct: activeProduct,
    );
  }
}
