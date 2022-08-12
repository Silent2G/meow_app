import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meow_app/constants.dart';
import 'package:meow_app/models/random_fact.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.randomApiHost)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        baseUrl: Constants.randomApiHost,
        responseType: ResponseType.plain,
        receiveTimeout: 5000,
        connectTimeout: 15000,
        headers: {
          HttpHeaders.userAgentHeader: "dio",
          "Connection": "keep-alive",
        });
    dio.options.headers["Content-Type"] = "application/json";
    return _ApiClient(dio);
  }

  @GET("api/random")
  Future<List<RandomFact>> getRandomFact();
}
