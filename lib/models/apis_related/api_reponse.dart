//

import 'paginate.dart';

abstract class ApiReponse<T> {
  T? data;
  bool status;
  String? message;
  int code;
  Paginate? paginate;
  String? whatsappMessage;
  ApiReponse({
    this.data,
    required this.status,
    this.message,
    required this.code,
    this.paginate,
    this.whatsappMessage,
  });
}
