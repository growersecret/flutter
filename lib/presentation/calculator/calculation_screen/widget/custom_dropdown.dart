import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';
import '../../../../theme/custom_theme.dart';
import '../cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../cubit/dropdownitemClick/dropdownitem_click_cubit.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    context.read<DryFertilizerCubit>().getDryFertilizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 54,
            decoration: BoxDecoration(
                borderRadius: context
                        .watch<DropdownitemClickCubit>()
                        .state
                        .dropdownItenClicked
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))
                    : BorderRadius.circular(10),
                color: Colors.white,
                border: context
                        .watch<DropdownitemClickCubit>()
                        .state
                        .dropdownItenClicked
                    ? null
                    : Border.all(color: Colors.white),
                boxShadow: context
                        .watch<DropdownitemClickCubit>()
                        .state
                        .dropdownItenClicked
                    ? []
                    : const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0.5),
                            blurRadius: 0.03,
                            spreadRadius: 0.03)
                      ]),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                context
                        .watch<DropdownitemClickCubit>()
                        .state
                        .dropdownItenClicked
                    ? Icon(Icons.expand_more_outlined,
                        color: CustomTheme.primaryColor, size: 30)
                    : Icon(Icons.arrow_forward_ios,
                        color: CustomTheme.primaryColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(context.watch<DropdownIndexCubit>().state.fertilizer,
                      style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
        context.watch<DropdownitemClickCubit>().state.dropdownItenClicked
            ? SizedBox(
                height: 55 *
                    context
                        .read<DryFertilizerCubit>()
                        .state
                        .dryFertilizer
                        .length
                        .toDouble(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: context
                        .read<DryFertilizerCubit>()
                        .state
                        .dryFertilizer
                        .length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.read<DropdownIndexCubit>().getdropdowndetails(
                              index,
                              context
                                  .read<DryFertilizerCubit>()
                                  .state
                                  .dryFertilizer[index]
                                  .name!);
                          context
                              .read<DropdownitemClickCubit>()
                              .clickedDropDown();
                        },
                        child: Container(
                          height: 54,
                          // width: 342.w,
                          padding: const EdgeInsets.only(top: 17, left: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: index == 0
                                ? Border(
                                    top: BorderSide(color: Colors.grey),
                                    bottom: BorderSide(
                                        color: CustomTheme.greylight))
                                : index ==
                                        context
                                                .read<DryFertilizerCubit>()
                                                .state
                                                .dryFertilizer
                                                .length -
                                            1
                                    ? null
                                    : Border(
                                        bottom: BorderSide(
                                            color: CustomTheme.greylight)),
                            borderRadius: index ==
                                    context
                                            .read<DryFertilizerCubit>()
                                            .state
                                            .dryFertilizer
                                            .length -
                                        1
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )
                                : null,
                          ),
                          child: Text(
                            context
                                .read<DryFertilizerCubit>()
                                .state
                                .dryFertilizer[index]
                                .name!,
                            style: TextStyle(
                                color: CustomTheme.textColor, fontSize: 15),
                          ),
                        ),
                      );
                    }),
              )
            : Container()
      ],
    );
  }
}
