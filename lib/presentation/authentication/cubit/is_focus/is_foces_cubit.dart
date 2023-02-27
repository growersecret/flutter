import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_foces_state.dart';

class IsFocesCubit extends Cubit<IsFocesState> {
  IsFocesCubit() : super(IsFocesState.initial());

  void focusChanger() {
    emit(state.copyWith(isFocus: true));
  }

  emitinitialState() {
    emit(IsFocesState.initial());
  }
}
