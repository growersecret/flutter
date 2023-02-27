// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dropdownitem_click_cubit1.dart';

// ignore: must_be_immutable
class DropdownitemClickState1 extends Equatable {
  bool dropdownItenClicked1;
  DropdownitemClickState1({
    required this.dropdownItenClicked1,
  });

  factory DropdownitemClickState1.initial() {
    return DropdownitemClickState1(dropdownItenClicked1: false);
  }

  @override
  List<Object> get props => [dropdownItenClicked1];

  @override
  bool get stringify => true;

  DropdownitemClickState1 copyWith({
    bool? dropdownItenClicked1,
  }) {
    return DropdownitemClickState1(
      dropdownItenClicked1: dropdownItenClicked1 ?? this.dropdownItenClicked1,
    );
  }
}
