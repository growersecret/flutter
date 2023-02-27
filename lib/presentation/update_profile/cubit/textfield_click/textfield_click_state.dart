// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'textfield_click_cubit.dart';

class TextfieldClickState extends Equatable {
  final bool emailClick;
  final bool numberClick;
  final bool addressClick;
  TextfieldClickState({
    required this.emailClick,
    required this.numberClick,
    required this.addressClick,
  });

  factory TextfieldClickState.initial() {
    return TextfieldClickState(
        emailClick: false, numberClick: false, addressClick: false);
  }

  @override
  List<Object> get props => [emailClick, numberClick, addressClick];

  TextfieldClickState copyWith({
    bool? emailClick,
    bool? numberClick,
    bool? addressClick,
  }) {
    return TextfieldClickState(
      emailClick: emailClick ?? this.emailClick,
      numberClick: numberClick ?? this.numberClick,
      addressClick: addressClick ?? this.addressClick,
    );
  }
}
