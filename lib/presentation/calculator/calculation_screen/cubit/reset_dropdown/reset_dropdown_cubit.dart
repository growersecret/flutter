import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reset_dropdown_state.dart';

class ResetDropdownCubit extends Cubit<ResetDropdownState> {
  ResetDropdownCubit() : super(ResetDropdownState.initial());

  void resetScreen() {
    emit(state.copyWith(reset: true));
  }
}
