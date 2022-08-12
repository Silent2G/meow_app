import 'package:dio/dio.dart';

import '../api_client.dart';

class BaseNetwork {
  late final Dio dio;
  late final ApiClient apiClient;

  BaseNetwork() {
    dio = Dio();
    apiClient = ApiClient(dio);
  }
}
