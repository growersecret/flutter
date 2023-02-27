
part of 'liquid_fertilizer_cubit.dart';

enum LiquidFertilizerStatus {
  initial,
  loading,
  loaded,
  error,
}

class LiquidFertilizerState extends Equatable {
  final LiquidFertilizerStatus status;
  final List liquidFertilizer;
  final CustomError error;
  LiquidFertilizerState({
    required this.status,
    required this.liquidFertilizer,
    required this.error,
  });

  factory LiquidFertilizerState.initial() {
    return LiquidFertilizerState(
        liquidFertilizer: [],
        status: LiquidFertilizerStatus.initial,
        error: CustomError());
  }

  @override
  List<Object> get props => [liquidFertilizer];



  LiquidFertilizerState copyWith({
    LiquidFertilizerStatus? status,
    List? liquidFertilizer,
    CustomError? error,
  }) {
    return LiquidFertilizerState(
      status: status ?? this.status,
      liquidFertilizer: liquidFertilizer ?? this.liquidFertilizer,
      error: error ?? this.error,
    );
  }
}
