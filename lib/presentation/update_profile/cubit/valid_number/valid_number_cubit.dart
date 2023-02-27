import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'valid_number_state.dart';

class ValidNumberCubit extends Cubit<ValidNumberState> {
  ValidNumberCubit() : super(ValidNumberState.initial());

  void checkphone(String number) {
    emit(state.copyWith(validphone: number.isNotEmpty && number.length == 10));
  }

  void getinitialState() {
    emit(ValidNumberState.initial());
  }
}
