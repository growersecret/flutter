import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/custom_theme.dart';
import '../cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../cubit/dry_fertilizer/dry_fertilizer_cubit.dart';

class DropDownOptionsWidget extends StatelessWidget {
  const DropDownOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 342,
      padding: const EdgeInsets.only(top: 0, left: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0.5),
              blurRadius: 0.03,
              spreadRadius: 0.03,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('N'),
              SizedBox(
                width: 18,
              ),
              Text(
                context
                    .read<DryFertilizerCubit>()
                    .state
                    .dryFertilizer[
                        context.watch<DropdownIndexCubit>().state.dropdownindex]
                    .percentN!,
                style: TextStyle(color: CustomTheme.primaryColor),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('P'),
              SizedBox(
                width: 18,
              ),
              Text(
                context
                    .read<DryFertilizerCubit>()
                    .state
                    .dryFertilizer[
                        context.watch<DropdownIndexCubit>().state.dropdownindex]
                    .percentP!,
                style: TextStyle(color: CustomTheme.primaryColor),
              ),
            ],
          ),
          Row(
            children: [
              Text('K'),
              SizedBox(
                width: 18,
              ),
              Text(
                context
                    .read<DryFertilizerCubit>()
                    .state
                    .dryFertilizer[
                        context.watch<DropdownIndexCubit>().state.dropdownindex]
                    .percentK!,
                style: TextStyle(color: CustomTheme.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
