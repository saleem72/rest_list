// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:dartz/dartz.dart';

import '../../../../helpers/jsons.dart';
import '../../../../models/app_user/app_user.dart';
import '../../../../models/failure.dart';
import '../../../../models/apis_related/base_service.dart';
import '../../../../models/product.dart';
import '../../../../models/requests_bodies/get_product_body.dart';
import '../models/categories_response.dart';
import '../models/get_product_response.dart';
import '../models/get_user_response.dart';
import 'dashboard_service.dart';

class DashboardServiceMock implements DashboardService {
  @override
  Future<Either<Failure, AppUser>> getData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      final jsonResponse = await JsonApiResponse.loadJsonData(
          JsonApiResponse.getUserSuccessResponse);
      final loginResponse = GetUserResponse.fromMap(jsonResponse);
      final result = BaseService.handleResponse<AppUser>(loginResponse);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesList>> getCategories(
      int restaurantId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      final jsonResponse = await JsonApiResponse.loadJsonData(
          JsonApiResponse.getCategoriesResponse);
      final loginResponse = CategoriesResponse.fromJson(jsonResponse);
      final result = BaseService.handleResponse<CategoriesList>(loginResponse);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductsList>> getProduct(GetProductBody model) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      final jsonResponse = await JsonApiResponse.loadJsonData(
          JsonApiResponse.getProductsResponse);
      final loginResponse = GetProductResponse.fromMap(jsonResponse);
      final result = BaseService.handleResponse<ProductsList>(loginResponse);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }
}
