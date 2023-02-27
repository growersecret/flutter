import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grower/data/model/custom_error.dart';
import '../../../../data/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

//function to login the user and get the otp
  Future<void> loginUser(String email) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var login = await userLogin(email);
      print(login);
      emit(state.copyWith(status: LoginStatus.loaded));
    } on CustomError catch (e) {
      emit(state.copyWith(status: LoginStatus.error, error: e));
    }
  }
}
