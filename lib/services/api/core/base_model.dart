import 'package:meow_app/services/api/core/server_error.dart';

class BaseApiModel<T> {
  ServerError? _error;
  T? _data;

  set setException(ServerError error) => _error = error;

  ServerError? get exception => _error;

  set setData(T data) => _data = data;

  T? get data => _data;
}
