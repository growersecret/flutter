part of 'reset_dropdown_cubit.dart';

class ResetDropdownState extends Equatable {
  final bool reset;
  ResetDropdownState({
    required this.reset,
  });

  factory ResetDropdownState.initial() {
    return ResetDropdownState(reset: false);
  }
  @override
  List<Object> get props => [reset];

  ResetDropdownState copyWith({
    bool? reset,
  }) {
    return ResetDropdownState(
      reset: reset ?? this.reset,
    );
  }
}
