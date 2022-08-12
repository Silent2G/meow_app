import 'package:dio/dio.dart';

class ServerError implements Exception {
  int? _errorCode;
  String? _errorMessage;

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  int? get errorCode => _errorCode;

  String? get errorMessage => _errorMessage;

  String? _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.other:
        _errorMessage = "Some other error ${error.response?.statusMessage}";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        _errorMessage =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
    }
    _errorCode = error.response?.statusCode;
    return _errorMessage;
  }
}
