part of 'other_nutrients_cubit.dart';

enum OtherNutrientsStatus {
  initial,
  loading,
  loaded,
  error,
}

class OtherNutrientsState extends Equatable {
  final OtherNutrientsStatus status;
  final OtherNutrientsDetails otherNutrients;
  final CustomError error;
  OtherNutrientsState({
    required this.status,
    required this.otherNutrients,
    required this.error,
  });

  factory OtherNutrientsState.initial() {
    return OtherNutrientsState(
        status: OtherNutrientsStatus.initial,
        otherNutrients:
            OtherNutrientsDetails(otherNutrients: <OtherNutrients>[]),
        error: CustomError());
  }

  @override
  List<Object> get props => [status, otherNutrients, error];

  OtherNutrientsState copyWith({
    OtherNutrientsStatus? status,
    OtherNutrientsDetails? otherNutrients,
    CustomError? error,
  }) {
    return OtherNutrientsState(
      status: status ?? this.status,
      otherNutrients: otherNutrients ?? this.otherNutrients,
      error: error ?? this.error,
    );
  }
}
