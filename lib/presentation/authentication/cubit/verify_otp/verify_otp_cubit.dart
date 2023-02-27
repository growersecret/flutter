import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grower/data/model/custom_error.dart';
import 'package:grower/data/repository/otp_verify_repository.dart';
import '../../../../data/model/verify_otp_model.dart';
part 'verify_otp_state.dart';


class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpState.initial());

  Future<void> otpVerify(String email, String otp) async {
    try {
      emit(state.copyWith(status: VerifyStatus.loading));
      VerifyOtpModel data = await verifyOtp(email, otp);
      print(data);
      emit(state.copyWith(status: VerifyStatus.loaded, verifyotp: data));
    } on CustomError catch (e) {
      emit(state.copyWith(status: VerifyStatus.error, error: e));
    }
  }
}
