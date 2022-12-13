//

import 'package:rest_list/helpers/safe/safe.dart';

abstract class DashboardService {
  Safe get safe;
  Future<bool> getData();
}

class DashboardServiceMock implements DashboardService {
  DashboardServiceMock({required this.safe});

  @override
  Future<bool> getData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Future.value(true);
  }

  @override
  final Safe safe;
}
