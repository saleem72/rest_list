//

import 'package:rest_list/screens/core/home_screen/service/dashboard_service.dart';

abstract class DashboardRepository {
  DashboardService get service;

  Future<bool> getData();
}

class DashboardRepositoryMock implements DashboardRepository {
  DashboardRepositoryMock({required this.service});

  @override
  final DashboardService service;

  @override
  Future<bool> getData() {
    return service.getData();
  }
}
