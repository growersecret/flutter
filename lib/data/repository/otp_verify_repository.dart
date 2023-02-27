import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../const/const.dart';
import '../model/verify_otp_model.dart';

Future<VerifyOtpModel> verifyOtp(String email, String otp) async {
  Dio dio = Dio();
  final prefs = await SharedPreferences.getInstance();
  try {
    Response response = await dio.post('$baseUrl/user/verify',
        data: json.encode({"email": email, "otp": otp}));
    VerifyOtpModel res = VerifyOtpModel.fromMap(response.data);
    res.status == 200
        ? prefs.setBool('isLoggedIn', true)
        : prefs.setBool('isLoggedIn', false);
    prefs.setString('email', email);
    print(response);
    return res;
  } catch (e) {
    print('error-->$e');
    throw Exception(e);
  }
}
