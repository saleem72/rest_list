//

import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class JsonApiResponse {
  JsonApiResponse._();

  static const _path = 'assets/jsons/';
  static const loginSuccessResponse = '${_path}login_success_response.json';
  static const getUserSuccessResponse = '${_path}get_user_success.json';
  static const getCategoriesResponse = '${_path}restaurant_categories.json';
  static const getProductsResponse = '${_path}get_products_response.json';

  static Future<Map<String, dynamic>> loadJsonData(String file) async {
    var jsonText = await rootBundle.loadString(file);
    final result = convert.jsonDecode(jsonText) as Map<String, dynamic>;
    return result;
  }
}
