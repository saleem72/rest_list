// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rest_list/screens/auth/login_screen/models/get_product_response.dart';

import 'package:rest_list/screens/auth/login_screen/models/login_response/categories_response.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/get_product_entries.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/user.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/product.dart';

import '../../../../helpers/jsons.dart';
import '../../../../helpers/safe/safe.dart';
import '../../../../models/failure.dart';
import '../../../auth/login_screen/models/login_response/get_user_response.dart';
import '../../../auth/login_screen/models/login_response/login_response.dart';
import 'dashboard_service.dart';

class DashboardServiceMock implements DashboardService {
  @override
  Future<Either<Failure, LoginUser>> getData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      final jsonResponse = await JsonApiResponse.loadJsonData(
          JsonApiResponse.getUserSuccessResponse);
      final loginResponse = GetUserResponse.fromMap(jsonResponse);
      final result = BaseService.handleResponse<LoginUser>(loginResponse);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesList>> getCategories(
      String token, int restaurantId) async {
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

  Future<Either<Failure, ProductsList>> getProduct(
      GetProductEntries model) async {
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
