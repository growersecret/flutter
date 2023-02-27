import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../data/model/custom_error.dart';
import '../../../../../data/model/other_nutrients_model.dart';
import '../../../../../data/repository/other_nutrients_details_repository.dart';
part 'other_nutrients_state.dart';

class OtherNutrientsCubit extends Cubit<OtherNutrientsState> {
  OtherNutrientsCubit() : super(OtherNutrientsState.initial());

  Future getOtherNutrients() async {
    emit(state.copyWith(status: OtherNutrientsStatus.loading));
    try {
      var otherNutrients = await getOtherNutrientsDetails();
      print(otherNutrients);
      emit(state.copyWith(
          otherNutrients: otherNutrients, status: OtherNutrientsStatus.loaded));
    } on CustomError catch (e) {
      emit(state.copyWith(status: OtherNutrientsStatus.error, error: e));
    }
  }
}
