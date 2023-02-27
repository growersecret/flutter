import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'dropdownitem_click_state1.dart';

class DropdownitemClickCubit1 extends Cubit<DropdownitemClickState1> {
  DropdownitemClickCubit1() : super(DropdownitemClickState1.initial());

  void clickedDropDown() {
    emit(state.copyWith(dropdownItenClicked1: !state.dropdownItenClicked1));
  }

  clickReversed1() {
    emit(DropdownitemClickState1.initial());
  }
}
