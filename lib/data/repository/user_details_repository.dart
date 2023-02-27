import 'package:dio/dio.dart';
import 'package:grower/data/const/const.dart';
import 'package:grower/data/model/user_details_model.dart';
import 'package:grower/data/repository/network_error_handler.dart';

Future<UserDetails> getUserDetails(String email) async {
  Dio dio = Dio();

  try {
    final response = await dio.get('$baseUrl/userdetail/$email');
    if (response.statusCode != 200) {
      throw Exception(networkErrorHandler(response));
    }
    var userDetails = UserDetails.fromJson(response.data);
    print('user-->$userDetails');
    return userDetails;
  } catch (e) {
    print(e);
    rethrow;
  }
}
