// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dropdown_index_cubit1.dart';

// ignore: must_be_immutable
class DropdownIndexState1 extends Equatable {
  int dropdownindex;
  String fertilizer;
  DropdownIndexState1({
    required this.dropdownindex,
    required this.fertilizer,
  });

  factory DropdownIndexState1.initial() {
    return DropdownIndexState1(
        dropdownindex: 0, fertilizer: 'Select fertilizer');
  }
  @override
  List<Object?> get props => [dropdownindex];

  @override
  bool get stringify => true;

  DropdownIndexState1 copyWith({
    int? dropdownindex,
    String? fertilizer,
  }) {
    return DropdownIndexState1(
      dropdownindex: dropdownindex ?? this.dropdownindex,
      fertilizer: fertilizer ?? this.fertilizer,
    );
  }
}
