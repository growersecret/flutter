import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grower/heiper/validator.dart';

part 'email_checker_state.dart';

class EmailCheckerCubit extends Cubit<EmailCheckerState> {
  EmailCheckerCubit() : super(EmailCheckerState.initial());

  checkEmail(String email) {
    emit(state.copyWith(isemailValid: email.isValidEmail));
  }

  getemailInitialState() {
    emit(EmailCheckerState.initial());
  }
}
