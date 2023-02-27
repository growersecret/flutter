import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'not_empty_str_validator_state.dart';

class NotEtyStrValidatorCubit extends Cubit<NotEtyStrValidatorState> {
  NotEtyStrValidatorCubit() : super(NotEtyStrValidatorState.initial());

  void checkName(String name) {
    emit(state.copyWith(validname: name.isNotEmpty));
  }

  void checkaddress(String address) {
    emit(state.copyWith(validaddress: address.isNotEmpty));
  }

  void getInitialState() {
    emit(NotEtyStrValidatorState.initial());
  }
}
