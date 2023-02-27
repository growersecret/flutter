import 'package:dio/dio.dart';

String networkErrorHandler(Response response) {
  final statusCode = response.statusCode;
  final rstatusMessage = response.statusMessage;

  final String errorMessage =
      'Request failed\nStatus Code: $statusCode\nReason: $rstatusMessage';

  return errorMessage;
}
