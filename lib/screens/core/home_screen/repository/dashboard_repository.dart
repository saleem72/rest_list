//

import 'package:dartz/dartz.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/user.dart';
import 'package:rest_list/screens/core/home_screen/service/dashboard_service.dart';

import '../../../../models/failure.dart';
import '../../../auth/login_screen/models/login_response/categories_response.dart';
import '../../../auth/login_screen/models/login_response/get_product_entries.dart';
import '../../../auth/login_screen/models/login_response/product.dart';

abstract class DashboardRepository {
  DashboardService get service;
  LoginUser? get data;

  Future<Either<Failure, LoginUser>> getData();
  Future<Either<Failure, CategoriesList>> getCategories(int restaurantId);
  Future<Either<Failure, ProductsList>> getProduct(GetProductEntries model);
}

class DashboardRepositoryMock implements DashboardRepository {
  DashboardRepositoryMock({required this.service});

  @override
  LoginUser? data;
  @override
  final DashboardService service;

  Failure? failure;
  bool isGettingData = false;
  bool dataHasBeenFetched = false;
  @override
  Future<Either<Failure, LoginUser>> getData() async {
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

  _handleReturnedData(LoginUser returnedData) {
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
    final result = service.getCategories('', restaurantId);
    return result;
  }

  @override
  Future<Either<Failure, ProductsList>> getProduct(GetProductEntries model) {
    final result = service.getProduct(model);
    return result;
  }
}
