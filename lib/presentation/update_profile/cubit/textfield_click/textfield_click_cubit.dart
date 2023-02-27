import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'textfield_click_state.dart';

class TextfieldClickCubit extends Cubit<TextfieldClickState> {
  TextfieldClickCubit() : super(TextfieldClickState.initial());

  void emailtextfieldClick() {
    emit(state.copyWith(emailClick: true));
  }

  void numbertextfieldClick() {
    emit(state.copyWith(numberClick: true));
  }

  void addresstextfieldClick() {
    emit(state.copyWith(addressClick: true));
  }
}
