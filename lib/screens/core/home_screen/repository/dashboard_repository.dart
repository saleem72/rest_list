//

import 'package:dartz/dartz.dart';
import 'package:rest_list/models/app_user/app_user.dart';
import 'package:rest_list/screens/core/home_screen/service/dashboard_service.dart';

import '../../../../models/failure.dart';
import '../models/categories_response.dart';
import '../../../../models/requests_bodies/get_product_body.dart';
import '../../../../models/product.dart';

abstract class DashboardRepository {
  DashboardService get service;
  AppUser? get data;

  Future<Either<Failure, AppUser>> getData();
  Future<Either<Failure, CategoriesList>> getCategories(int restaurantId);
  Future<Either<Failure, ProductsList>> getProduct(GetProductBody model);
  setUser(AppUser user);
}

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({required this.service});

  @override
  AppUser? data;
  @override
  final DashboardService service;

  Failure? failure;
  bool isGettingData = false;
  bool dataHasBeenFetched = false;

  @override
  setUser(AppUser user) {
    data = user;
    dataHasBeenFetched = true;
  }

  @override
  Future<Either<Failure, AppUser>> getData() async {
    if (!dataHasBeenFetched) {
      isGettingData = true;
      final result = await service.getData();
      result.fold(
        (failure) => _handleFailure(failure),
        (getUserData) => _handleReturnedData(getUserData),
      );
      return result;
    } else {
      if (data != null) {
        return Right(data!);
      } else {
        return Left(failure ?? const Failure(message: 'unKnown Error'));
      }
    }
  }

  _handleReturnedData(AppUser returnedData) {
    data = returnedData;
    dataHasBeenFetched = true;
    isGettingData = false;
  }

  _handleFailure(Failure returnedFailure) {
    failure = returnedFailure;
  }

  @override
  Future<Either<Failure, CategoriesList>> getCategories(
      int restaurantId) async {
    final result = service.getCategories(restaurantId);
    return result;
  }

  @override
  Future<Either<Failure, ProductsList>> getProduct(GetProductBody model) {
    final result = service.getProduct(model);
    return result;
  }
}
