import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/repository/reduce_hit_repository.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit() : super(ReminderState.initial());

  Future hitreduce() async {
    final prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString('email')!;
    try {
      var hitremain = await reduceHit(email);
      emit(state.copyWith(hitReminder: hitremain.data!.hitRemaining));
      print('hit-->${hitremain.data!.hitRemaining}');
    } catch (e) {
      print('error->$e');
    }
  }

  // void noOfHit() {
  //   emit(state.copyWith(hitReminder: state.hitReminder - 1));
  // }
}
