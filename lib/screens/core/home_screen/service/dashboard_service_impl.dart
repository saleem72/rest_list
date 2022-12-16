//

import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/constants.dart';
import '../../../../models/apis_related/apis_headers.dart';
import '../../../../models/failure.dart';
import '../../../../models/apis_related/base_service.dart';
import '../models/get_product_response.dart';
import '../models/categories_response.dart';
import '../../../../models/requests_bodies/get_product_body.dart';
import '../models/get_user_response.dart';
import '../../../../models/product.dart';
import '../../../../models/app_user/app_user.dart';
import 'dashboard_service.dart';

class DashboardServiceImpl implements DashboardService {
  @override
  Future<Either<Failure, AppUser>> getData() async {
    try {
      const url = '${Constants.baseURL}current-user';
      final uri = Uri.parse(url);
      final client = http.Client();
      final response = await client.get(uri, headers: ApisHeaders.authHeaders);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final temp = GetUserResponse.fromMap(jsonResponse);
      final result = BaseService.handleResponse<AppUser>(temp);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesList>> getCategories(
      int restaurantId) async {
    try {
      const url = '${Constants.baseURL}restaurant/categories';
      final Map<String, dynamic> queryParameters = {
        "restaurant_id": restaurantId.toString()
      };
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final client = http.Client();
      final response = await client.get(uri, headers: ApisHeaders.authHeaders);

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final temp = CategoriesResponse.fromJson(jsonResponse);
      final result = BaseService.handleResponse<CategoriesList>(temp);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductsList>> getProduct(GetProductBody model) async {
    try {
      const url = '${Constants.baseURL}restaurant/products';
      final Map<String, dynamic> queryParameters = model.toMap();
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final client = http.Client();
      final response = await client.get(uri, headers: ApisHeaders.authHeaders);

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final temp = GetProductResponse.fromMap(jsonResponse);
      final result = BaseService.handleResponse<ProductsList>(temp);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }
}
