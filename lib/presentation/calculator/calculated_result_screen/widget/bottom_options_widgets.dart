import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/calculator/calculation_screen/calculator_screen.dart';
import '../../../../heiper/storing_calculation_data.dart';
import '../../../../theme/custom_theme.dart';
import '../../../pdf_preview/pdf_preview_screen.dart';
import '../../../update_profile/cubit/user_details/user_details_cubit.dart';
import '../../calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';
import '../../widgets/alert_dialog_widget.dart';

class BottomOptionsModel {
  final String title;
  final String iconUrl;

  BottomOptionsModel({
    required this.title,
    required this.iconUrl,
  });
}

List<BottomOptionsModel> optionsList = [
  BottomOptionsModel(title: 'Home', iconUrl: 'assets/home.svg'),
  BottomOptionsModel(title: 'Reset', iconUrl: 'assets/reset.svg'),
  BottomOptionsModel(title: 'PDF', iconUrl: 'assets/pdf.svg'),
  BottomOptionsModel(title: 'Exit', iconUrl: 'assets/exit.svg')
];

class BottomOptionsWidget extends StatelessWidget {
  const BottomOptionsWidget({super.key});
//reset function
  _reset(BuildContext context) {
    var otherNutrients =
        context.read<OtherNutrientsCubit>().state.otherNutrients.otherNutrients;
    showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
              content: 'You are going to reset Calculator.',
              leftBtnTitle: 'Yes, Reset',
              title: 'Are you sure you want to reset?',
              onTap: () {
                context.push("/resetloadingscreen");
                for (var i = 0; i < otherNutrients.length; i++) {
                  deleteText('dryothernutrients${i}');
                  deleteText('liquidothernutrients${i}');
                }
              },
            ));
  }

//Exit function
  _exit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
              content: 'You are going to Exit Calculator.',
              leftBtnTitle: 'Yes, Exit',
              title: 'Are you sure?',
              onTap: () {
                SystemNavigator.pop();
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: optionsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      index == 0
                          ? context.goNamed('calculator', pathParameters: {
                      'profile_setup': context
                          .read<UserDetailsCubit>()
                          .state
                          .userDetails
                          .data
                          .profileSetup
                          .toString()
                    })
                          : index == 1
                              ? _reset(context)
                              : index == 2
                                  ? screenNavigator(context, PdfPreviewScreen())
                                  : index == 3
                                      ? _exit(context)
                                      : null;
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(left: 10, right: 15, bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: CustomTheme.shadowDecoration,
                      child: ListView(
                        children: [
                          SvgPicture.asset(optionsList[index].iconUrl,
                              height: 25),
                          SizedBox(height: 5),
                          Text(
                            optionsList[index].title,
                            style: TextStyle(
                                color: CustomTheme.primaryColor, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
