import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_field_clicked_state.dart';

class TextFieldClickedCubit extends Cubit<TextFieldClickedState> {
  TextFieldClickedCubit() : super(TextFieldClickedState.initial());

  void clicked() {
    emit(state.copyWith(textFieldClicked: true));
  }
  void clickreversed(){
    emit(state.copyWith(textFieldClicked: false));
  }
}
