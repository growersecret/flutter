// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dropdown_index_cubit.dart';

// ignore: must_be_immutable
class DropdownIndexState extends Equatable {
  int dropdownindex;
  String fertilizer;
  DropdownIndexState({
    required this.dropdownindex,
    required this.fertilizer,
  });

  factory DropdownIndexState.initial() {
    return DropdownIndexState(
        dropdownindex: 0, fertilizer: 'Select fertilizer');
  }
  @override
  List<Object?> get props => [dropdownindex];

  @override
  bool get stringify => true;

  DropdownIndexState copyWith({
    int? dropdownindex,
    String? fertilizer,
  }) {
    return DropdownIndexState(
      dropdownindex: dropdownindex ?? this.dropdownindex,
      fertilizer: fertilizer ?? this.fertilizer,
    );
  }
}
