part of 'not_empty_str_validator_cubit.dart';

class NotEtyStrValidatorState extends Equatable {
  final bool validname;
  final bool validaddress;
  NotEtyStrValidatorState({
    required this.validname,
    required this.validaddress,
  });
  factory NotEtyStrValidatorState.initial() {
    return NotEtyStrValidatorState(validname: true, validaddress: true);
  }
  @override
  List<Object> get props => [validname, validaddress];

  NotEtyStrValidatorState copyWith({
    bool? validname,
    bool? validaddress,
  }) {
    return NotEtyStrValidatorState(
      validname: validname ?? this.validname,
      validaddress: validaddress ?? this.validaddress,
    );
  }
}
