import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../data/model/custom_error.dart';
import '../../../../../data/repository/category_details_repository.dart';
part 'liquid_fertilizer_state.dart';

class LiquidFertilizerCubit extends Cubit<LiquidFertilizerState> {
  LiquidFertilizerCubit() : super(LiquidFertilizerState.initial());

  Future getliquidFertilizer() async {
    emit(state.copyWith(status: LiquidFertilizerStatus.loading));
    try {
      var catalogue = await getCategoryDetails();
      emit(state.copyWith(
        liquidFertilizer: catalogue.catalogues!
            .where((e) => e.type.toString().startsWith('liquid fertilizer'))
            .toList(),
        status: LiquidFertilizerStatus.loaded,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(status: LiquidFertilizerStatus.error, error: e));
    }
  }

  getinitialState() {
    emit(LiquidFertilizerState.initial());
  }
}
