part of 'verify_otp_cubit.dart';

enum VerifyStatus {
  initial,
  loading,
  loaded,
  error,
}

class VerifyOtpState extends Equatable {
  final VerifyStatus status;
  final VerifyOtpModel verifyotp;
  final CustomError error;
  VerifyOtpState({
    required this.status,
    required this.verifyotp,
    required this.error,
  });

  factory VerifyOtpState.initial() {
    return VerifyOtpState(
        status: VerifyStatus.initial,
        verifyotp: VerifyOtpModel.initial(),
        error: CustomError());
  }
  @override
  List<Object> get props => [status, verifyotp, error];

  VerifyOtpState copyWith({
    VerifyStatus? status,
    VerifyOtpModel? verifyotp,
    CustomError? error,
  }) {
    return VerifyOtpState(
      status: status ?? this.status,
      verifyotp: verifyotp ?? this.verifyotp,
      error: error ?? this.error,
    );
  }
}
