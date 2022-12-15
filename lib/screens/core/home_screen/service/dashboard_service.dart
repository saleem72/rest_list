//

import 'package:dartz/dartz.dart';
import 'package:rest_list/helpers/safe/safe.dart';

import '../../../../models/failure.dart';
import '../../../auth/login_screen/models/login_response/categories_response.dart';
import '../../../auth/login_screen/models/login_response/get_product_entries.dart';
import '../../../auth/login_screen/models/login_response/user.dart';
import '../../../auth/login_screen/models/login_response/product.dart';

abstract class DashboardService {
  Future<Either<Failure, LoginUser>> getData();
  Future<Either<Failure, CategoriesList>> getCategories(
      String token, int restaurantId);
  Future<Either<Failure, ProductsList>> getProduct(GetProductEntries model);
}
