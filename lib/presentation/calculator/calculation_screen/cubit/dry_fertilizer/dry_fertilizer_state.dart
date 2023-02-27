part of 'dry_fertilizer_cubit.dart';

enum DryFertilizerStatus {
  initial,
  loading,
  loaded,
  error,
}

class DryFertilizerState extends Equatable {
  final DryFertilizerStatus status;
  final List dryFertilizer;
  final CustomError error;
  DryFertilizerState({
    required this.status,
    required this.dryFertilizer,
    required this.error,
  });
  factory DryFertilizerState.initial() {
    return DryFertilizerState(
        status: DryFertilizerStatus.initial,
        dryFertilizer: [],
        error: CustomError());
  }
  @override
  List<Object> get props => [status, dryFertilizer, error];

  DryFertilizerState copyWith({
    DryFertilizerStatus? status,
    List? dryFertilizer,
    CustomError? error,
  }) {
    return DryFertilizerState(
      status: status ?? this.status,
      dryFertilizer: dryFertilizer ?? this.dryFertilizer,
      error: error ?? this.error,
    );
  }
}
