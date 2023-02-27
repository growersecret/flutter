part of 'textfield_focus_cubit.dart';

class TextfieldFocusState extends Equatable {
  final bool namefocus;
  final bool numberfocus;
  final bool addressfocus;
  TextfieldFocusState({
    required this.namefocus,
    required this.numberfocus,
    required this.addressfocus,
  });

  factory TextfieldFocusState.initial() {
    return TextfieldFocusState(
        namefocus: false, numberfocus: false, addressfocus: false);
  }
  @override
  List<Object> get props => [namefocus, numberfocus, addressfocus];

  TextfieldFocusState copyWith({
    bool? namefocus,
    bool? numberfocus,
    bool? addressfocus,
  }) {
    return TextfieldFocusState(
      namefocus: namefocus ?? this.namefocus,
      numberfocus: numberfocus ?? this.numberfocus,
      addressfocus: addressfocus ?? this.addressfocus,
    );
  }
}
