import 'package:dio/dio.dart';
import 'package:grower/data/const/const.dart';
import 'package:grower/data/repository/network_error_handler.dart';
import '../model/other_nutrients_model.dart';

Future<OtherNutrientsDetails> getOtherNutrientsDetails() async {
  Dio dio = Dio();

  try {
    final response = await dio.get('$baseUrl/otherNutrients');

    if (response.statusCode != 200) {
      throw Exception(networkErrorHandler(response));
    }

    var othernutrientsDetails = OtherNutrientsDetails.fromJson(response.data);
    print('category-->$othernutrientsDetails');
    return othernutrientsDetails;
  } catch (e) {
    print(e);
    rethrow;
  }
}
