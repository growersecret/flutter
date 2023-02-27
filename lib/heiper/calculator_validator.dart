import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';

bool checkCalculatorValidation(
    BuildContext context,
    TextEditingController pound,
    TextEditingController gallon,
    TextEditingController density) {
  bool isvalid = context.read<DropdownIndexCubit>().state.fertilizer ==
          'Select fertilizer' ||
      context.read<DropdownIndexCubit1>().state.fertilizer ==
          'Select fertilizer' ||
      pound.text.isEmpty ||
      gallon.text.isEmpty ||
      density.text.isEmpty;

  return isvalid;
}
