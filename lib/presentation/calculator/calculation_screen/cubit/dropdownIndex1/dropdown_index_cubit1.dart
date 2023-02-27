import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_index_state1.dart';

class DropdownIndexCubit1 extends Cubit<DropdownIndexState1> {
  DropdownIndexCubit1() : super(DropdownIndexState1.initial());

  void getdropdowndetails(int index, String fertilizer) {
    emit(state.copyWith(dropdownindex: index, fertilizer: fertilizer));
  }

  getinitialState() {
    emit(DropdownIndexState1.initial());
  }
}
