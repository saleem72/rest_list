//

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/safe/safe.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  final shared = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => Safe(storage: shared));
}
