//

import '../../../../../dependancy_injection.dart' as di;
import '../../../../../helpers/safe/safe.dart';

class ApisHeaders {
  ApisHeaders._();

  static final Safe safe = di.locator();

  static final authHeaders = {
    "Authorization": "Bearer ${(safe.getToken() ?? '')}",
    "Connection": "keep-alive",
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Accept-Language": "en"
  };
}
