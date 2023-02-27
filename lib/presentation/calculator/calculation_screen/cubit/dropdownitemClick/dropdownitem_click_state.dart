// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dropdownitem_click_cubit.dart';

// ignore: must_be_immutable
class DropdownitemClickState extends Equatable {
  bool dropdownItenClicked;
  DropdownitemClickState({
    required this.dropdownItenClicked,
  });

  factory DropdownitemClickState.initial() {
    return DropdownitemClickState(dropdownItenClicked: false);
  }

  @override
  List<Object> get props => [dropdownItenClicked];

  DropdownitemClickState copyWith({
    bool? dropdownItenClicked,
  }) {
    return DropdownitemClickState(
      dropdownItenClicked: dropdownItenClicked ?? this.dropdownItenClicked,
    );
  }

  @override
  bool get stringify => true;
}
