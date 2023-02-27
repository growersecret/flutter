import 'package:dio/dio.dart';
import 'package:grower/data/const/const.dart';
import 'package:grower/data/repository/network_error_handler.dart';
import '../model/reduce_hit_model.dart';

Future<Reducehit> reduceHit(String email) async {
  Dio dio = Dio();

  try {
    final response = await dio.get('$baseUrl/reducehit/$email');

    if (response.statusCode != 200) {
      throw Exception(networkErrorHandler(response));
    }

    var reducehit = Reducehit.fromJson(response.data);
    print('category-->$reducehit');
    return reducehit;
  } catch (e) {
    print(e);
    rethrow;
  }
}
