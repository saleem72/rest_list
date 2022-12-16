//

import 'package:dartz/dartz.dart';

import '../../../../models/failure.dart';
import '../models/categories_response.dart';
import '../../../../models/requests_bodies/get_product_body.dart';
import '../../../../models/app_user/app_user.dart';
import '../../../../models/product.dart';

abstract class DashboardService {
  Future<Either<Failure, AppUser>> getData();
  Future<Either<Failure, CategoriesList>> getCategories(int restaurantId);
  Future<Either<Failure, ProductsList>> getProduct(GetProductBody model);
}
