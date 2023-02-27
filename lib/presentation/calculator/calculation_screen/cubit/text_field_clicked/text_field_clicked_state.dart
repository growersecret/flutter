part of 'text_field_clicked_cubit.dart';

class TextFieldClickedState extends Equatable {
  final bool textFieldClicked;
  TextFieldClickedState({
    required this.textFieldClicked,
  });
  factory TextFieldClickedState.initial() {
    return TextFieldClickedState(textFieldClicked: false);
  }

  @override
  List<Object> get props => [textFieldClicked];

  TextFieldClickedState copyWith({
    bool? textFieldClicked,
  }) {
    return TextFieldClickedState(
      textFieldClicked: textFieldClicked ?? this.textFieldClicked,
    );
  }
}
