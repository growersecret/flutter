import 'package:dio/dio.dart';
import 'package:grower/data/const/const.dart';
import 'package:grower/data/repository/network_error_handler.dart';
import '../model/category_details_model.dart';

Future<CatelogueDetails> getCategoryDetails() async {
  Dio dio = Dio();

  try {
    final response = await dio.get('$baseUrl/allCatalogue');

    if (response.statusCode != 200) {
      throw Exception(networkErrorHandler(response));
    }

    var categoryDetails = CatelogueDetails.fromJson(response.data);

    print('category-->$categoryDetails');
    return categoryDetails;
  } catch (e) {
    print(e);
    rethrow;
  }
}
