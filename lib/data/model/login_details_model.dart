class LoginDetails {
  final String email;
  final String otp;
  LoginDetails({
    required this.email,
    required this.otp,
  });

  factory LoginDetails.initial() {
    return LoginDetails(email: '', otp: '');
  }

  factory LoginDetails.fromMap(Map<String, dynamic> map) {
    return LoginDetails(
      email: map['data']['email'] as String,
      otp: map['data']['otp'] as String,
    );
  }
}
