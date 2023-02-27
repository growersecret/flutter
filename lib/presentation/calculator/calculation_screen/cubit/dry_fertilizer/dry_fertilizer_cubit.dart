import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../data/model/custom_error.dart';
import '../../../../../data/repository/category_details_repository.dart';
part 'dry_fertilizer_state.dart';

class DryFertilizerCubit extends Cubit<DryFertilizerState> {
  DryFertilizerCubit() : super(DryFertilizerState.initial());
  Future getDryFertilizer() async {
    emit(state.copyWith(status: DryFertilizerStatus.loading));
    try {
      var catalogue = await getCategoryDetails();
      emit(state.copyWith(
          dryFertilizer: catalogue.catalogues!
              .where((e) => e.type.toString().startsWith('dry fertilizer'))
              .toList(),
          status: DryFertilizerStatus.loaded));
    } on CustomError catch (e) {
      emit(state.copyWith(status: DryFertilizerStatus.error, error: e));
    }
  }

  void getinitialState() {
    emit(DryFertilizerState.initial());
  }
}
