import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meow_app/models/random_fact.dart';

import '../core/base_model.dart';
import '../core/base_network.dart';
import '../core/get_data.dart';
import '../core/server_error.dart';

class GetRandom extends BaseNetwork
    implements GetData<Future<BaseApiModel<List<RandomFact>>>> {
  @override
  Future<BaseApiModel<List<RandomFact>>> getData() async {
    List<RandomFact> response;
    try {
      response = await apiClient.getRandomFact();
    } catch (error, stacktrace) {
      Logger().e("Exception occured: $error\nstackTrace:\n$stacktrace");
      return BaseApiModel()
        ..setException = ServerError.withError(error: error as DioError);
    }
    return BaseApiModel()..setData = response;
  }
}
