part of 'valid_number_cubit.dart';

class ValidNumberState extends Equatable {
  final bool validphone;
  ValidNumberState({
    required this.validphone,
  });
  factory ValidNumberState.initial() {
    return ValidNumberState(validphone: true);
  }
  @override
  List<Object> get props => [validphone];

  ValidNumberState copyWith({
    bool? validphone,
  }) {
    return ValidNumberState(
      validphone: validphone ?? this.validphone,
    );
  }
}
