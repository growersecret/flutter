import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'textfield_focus_state.dart';

class TextfieldFocusCubit extends Cubit<TextfieldFocusState> {
  TextfieldFocusCubit() : super(TextfieldFocusState.initial());
  //run to make only the name field focus is true
  void focusName() {
    emit(state.copyWith(
        namefocus: true, numberfocus: false, addressfocus: false));
  }

  //run to make only the number field focus is true
  void focusNumber() {
    emit(state.copyWith(
        namefocus: false, numberfocus: true, addressfocus: false));
  }

  //run to make only the address field focus is true
  void focusAddress() {
    emit(state.copyWith(
        namefocus: false, numberfocus: false, addressfocus: true));
  }
}
