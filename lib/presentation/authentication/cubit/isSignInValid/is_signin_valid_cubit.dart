import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_signin_valid_state.dart';

class IsSigninValidCubit extends Cubit<IsSigninValidState> {
  IsSigninValidCubit() : super(IsSigninValidState.initial());

  checkSignIn(bool isvalid) {
    emit(state.copyWith(isSignInValid: isvalid));
  }
  emitInitialState(){
    emit(IsSigninValidState.initial());
  }
}
