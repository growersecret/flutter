import 'dart:convert';
import 'package:dio/dio.dart';
import '../const/const.dart';

Future updateUserDetails(
    String name, String address, String number, String email) async {
  Dio dio = Dio();
  try {
    Response response = await dio.patch('$baseUrl/updateUser/$email',
        data:
            json.encode({"name": name, "address": address, "number": number}));
    print(response);
  } catch (e) {
    print('error-->$e');
  }
}
