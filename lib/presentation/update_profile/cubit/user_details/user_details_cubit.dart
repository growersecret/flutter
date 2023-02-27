import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grower/data/repository/user_details_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/model/custom_error.dart';
import '../../../../data/model/user_details_model.dart';
part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsState.initial());

  Future userDetails() async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString('email')!;
    try {
      var userData = await getUserDetails(email);

      emit(state.copyWith(
          status: UserProfileStatus.loaded, userDetails: userData));
    } on CustomError catch (e) {
      emit(state.copyWith(status: UserProfileStatus.error, error: e));
    }
  }
}
