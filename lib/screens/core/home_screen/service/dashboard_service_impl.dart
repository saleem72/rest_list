//

import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:rest_list/helpers/constants.dart';
import 'package:http/http.dart' as http;
import 'package:rest_list/screens/auth/login_screen/models/login_response/apis_headers.dart';

import '../../../../models/failure.dart';
import '../../../auth/login_screen/models/get_product_response.dart';
import '../../../auth/login_screen/models/login_response/categories_response.dart';
import '../../../auth/login_screen/models/login_response/get_product_entries.dart';
import '../../../auth/login_screen/models/login_response/get_user_response.dart';
import '../../../auth/login_screen/models/login_response/login_response.dart';
import '../../../auth/login_screen/models/login_response/product.dart';
import '../../../auth/login_screen/models/login_response/user.dart';
import 'dashboard_service.dart';

class DashboardServiceImpl implements DashboardService {
  @override
  Future<Either<Failure, LoginUser>> getData() async {
    try {
      const url = '${Constants.baseURL}current-user';
      final uri = Uri.parse(url);
      final client = http.Client();
      final response = await client.get(uri, headers: ApisHeaders.authHeaders);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final temp = GetUserResponse.fromMap(jsonResponse);
      final result = BaseService.handleResponse<LoginUser>(temp);
      return result;
    } catch (ex) {
      return left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesList>> getCategories(
      String token, int restaurantId) async {
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
  Future<Either<Failure, ProductsList>> getProduct(
      GetProductEntries model) async {
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
