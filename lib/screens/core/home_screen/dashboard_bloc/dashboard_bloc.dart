import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_list/models/failure.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/get_product_entries.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/resturant.dart';
import 'package:rest_list/screens/core/home_screen/repository/dashboard_repository.dart';
import 'package:collection/collection.dart';

import '../../../auth/login_screen/models/login_response/categories_response.dart';
import '../../../auth/login_screen/models/login_response/product.dart';
import '../../../auth/login_screen/models/login_response/user.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.repository,
  }) : super(const DashboardState()) {
    on<DashboardGetData>(_onGetData);
    on<DashboardSetActiveRestaurant>(_onSetActiveRestaurant);
    on<DashBoardSetActiveCategory>(_onSetActiveCategory);
    on<DashBoardSetActiveSubCategory>(_onSetActiveSubCategory);
    on<DashboardGetProductForCategory>(_onGetProductForCategory);
    on<DashboardSetActiveProduct>(_onSetActiveProduct);
    on<DashboardClearError>(_onClearError);
  }

  final DashboardRepository repository;
  _onGetData(DashboardGetData event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await repository.getData();
    result.fold(
      (failure) {
        print('🈴 error: ${failure.message}');
        emit(state.copyWith(isLoading: false, failure: failure));
      },
      (getUserData) => _handleUserData(emit, getUserData),
    );
  }

  _handleUserData(Emitter<DashboardState> emit, LoginUser user) {
    if (user.restaurants.isNotEmpty) {
      final primaryRestaurant = user.restaurants
          .firstWhereOrNull((element) => element.isPrimary == 1);

      final Restaurant active = primaryRestaurant ?? user.restaurants[0];
      emit(state.copyWith(user: user, isLoading: false));
      add(DashboardSetActiveRestaurant(restaurant: active));
    } else {
      emit(state.copyWith(user: user, isLoading: false));
    }
  }

  _onSetActiveRestaurant(
      DashboardSetActiveRestaurant event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(activeRestaurant: event.restaurant));
    final categoriesResult =
        await repository.getCategories(event.restaurant.id);
    categoriesResult.fold(
      (failure) {
        emit(state.copyWith(failure: failure));
      },
      (data) {
        final newState = state.copyWith(categories: data);
        emit(newState);
        if (data.isNotEmpty) {
          add(DashBoardSetActiveCategory(category: data.first));
        }
      },
    );
  }

  _onSetActiveCategory(
      DashBoardSetActiveCategory event, Emitter<DashboardState> emit) {
    emit(state.copyWith(activeCatgory: event.category));
    if (event.category.subcategories.isNotEmpty) {
      add(DashBoardSetActiveSubCategory(
          category: event.category.subcategories.first));
    }
  }

  _onSetActiveSubCategory(
      DashBoardSetActiveSubCategory event, Emitter<DashboardState> emit) {
    emit(state.copyWith(activeSubCatgory: event.category, products: []));
    add(DashboardGetProductForCategory(
      restaurantId: state.activeRestaurant?.id ?? 0,
      categoryId: state.activeSubCatgory?.id ?? 0,
      page: 1,
      perPage: 25,
    ));
  }

  _onGetProductForCategory(DashboardGetProductForCategory event,
      Emitter<DashboardState> emit) async {
    final model = GetProductEntries(
      restaurantId: event.restaurantId,
      categoryId: event.categoryId,
      page: event.page,
      perPage: event.perPage,
    );
    final result = await repository.getProduct(model);
    result.fold(
      (failure) {
        print('🈴 error: ${failure.message}');
        emit(state.copyWith(failure: failure));
      },
      (data) {
        emit(state.copyWith(products: data));
      },
    );
  }

  _onSetActiveProduct(
      DashboardSetActiveProduct event, Emitter<DashboardState> emit) {
    emit(state.copyWith(activeProduct: event.product));
  }

  _onClearError(DashboardClearError event, Emitter<DashboardState> emit) {
    emit(state.clearError());
  }
}
