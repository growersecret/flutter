part of 'is_foces_cubit.dart';

class IsFocesState extends Equatable {
  final bool isFocus;
  IsFocesState({
    required this.isFocus,
  });

  factory IsFocesState.initial() {
    return IsFocesState(isFocus: false);
  }

  @override
  List<Object> get props => [isFocus];

  IsFocesState copyWith({
    bool? isFocus,
  }) {
    return IsFocesState(
      isFocus: isFocus ?? this.isFocus,
    );
  }
}
