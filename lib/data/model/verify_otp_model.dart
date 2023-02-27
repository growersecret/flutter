

class VerifyOtpModel {
  final int status;
  final String message;
  VerifyOtpModel({
    required this.status,
    required this.message,
  });

  factory VerifyOtpModel.initial() {
    return VerifyOtpModel(status: 0, message: '');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory VerifyOtpModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpModel(
      status: map['status'] as int,
      message: map['message'] as String,
    );
  }
}
