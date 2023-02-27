import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdownitem_click_state.dart';

class DropdownitemClickCubit extends Cubit<DropdownitemClickState> {
  DropdownitemClickCubit() : super(DropdownitemClickState.initial());

  void clickedDropDown() {
    emit(state.copyWith(dropdownItenClicked: !state.dropdownItenClicked));
  }

  void clickReversed() {
    emit(state.copyWith(dropdownItenClicked: false));
  }
}
