import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/liquid_fertilizer/liquid_fertilizer_cubit.dart';
import '../../../../theme/custom_theme.dart';
import '../cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import '../cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';

class CustomDropDown1 extends StatefulWidget {
  const CustomDropDown1({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  State<CustomDropDown1> createState() => _CustomDropDown1State();
}

class _CustomDropDown1State extends State<CustomDropDown1> {
  @override
  void initState() {
    context.read<LiquidFertilizerCubit>().getliquidFertilizer();
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
                        .watch<DropdownitemClickCubit1>()
                        .state
                        .dropdownItenClicked1
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))
                    : BorderRadius.circular(10),
                color: Colors.white,
                border: context
                        .watch<DropdownitemClickCubit1>()
                        .state
                        .dropdownItenClicked1
                    ? null
                    : Border.all(color: Colors.white),
                boxShadow: context
                        .watch<DropdownitemClickCubit1>()
                        .state
                        .dropdownItenClicked1
                    ? []
                    : const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0.5),
                          blurRadius: 0.03,
                          spreadRadius: 0.03,
                        ),
                      ]),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                context
                        .watch<DropdownitemClickCubit1>()
                        .state
                        .dropdownItenClicked1
                    ? Icon(
                        Icons.expand_more_outlined,
                        color: CustomTheme.primaryColor,
                        size: 30,
                      )
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: CustomTheme.primaryColor,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  context.watch<DropdownIndexCubit1>().state.fertilizer,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        context.watch<DropdownitemClickCubit1>().state.dropdownItenClicked1
            ? SizedBox(
                height: 55 *
                    context
                        .read<LiquidFertilizerCubit>()
                        .state
                        .liquidFertilizer
                        .length
                        .toDouble(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: context
                        .watch<LiquidFertilizerCubit>()
                        .state
                        .liquidFertilizer
                        .length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<DropdownIndexCubit1>()
                              .getdropdowndetails(
                                  index,
                                  context
                                      .read<LiquidFertilizerCubit>()
                                      .state
                                      .liquidFertilizer[index]
                                      .name);
                          context
                              .read<DropdownitemClickCubit1>()
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
                                                  .read<LiquidFertilizerCubit>()
                                                  .state
                                                  .liquidFertilizer
                                                  .length -
                                              1
                                      ? null
                                      : Border(
                                          bottom: BorderSide(
                                              color: CustomTheme.greylight)),
                              borderRadius: index ==
                                      context
                                              .read<LiquidFertilizerCubit>()
                                              .state
                                              .liquidFertilizer
                                              .length -
                                          1
                                  ? BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )
                                  : null),
                          child: Text(
                            context
                                .watch<LiquidFertilizerCubit>()
                                .state
                                .liquidFertilizer[index]
                                .name,
                            style: TextStyle(
                                color: CustomTheme.textColor, fontSize: 15),
                          ),
                        ),
                      );
                    }),
              )
            : Container(),
      ],
    );
  }
}
