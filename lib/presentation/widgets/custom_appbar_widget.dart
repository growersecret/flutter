import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/custom_theme.dart';
import '../calculator/calculated_result_screen/widget/result_bottom_model_sheet_widget.dart';
import '../calculator/calculation_screen/widget/calculator_bottom_model_sheet.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWidget(
      {super.key,
      required this.appbarTitle,
      required this.isresult,
      required this.ontapbackarrow});
  final String appbarTitle;
  final bool isresult;
  final VoidCallback ontapbackarrow;
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: ontapbackarrow,
          icon: appbarTitle == 'Calculator'
              ? SvgPicture.asset('assets/cycle.svg')
              : const Icon(
                  Icons.arrow_back_ios,
                  color: CustomTheme.primaryColor,
                )),
      title: Container(
        height: 34,
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CustomTheme.greylight,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/grower_logo.png',
              height: 30,
            ),
            Text(
              appbarTitle,
              style: TextStyle(color: CustomTheme.primaryColor, fontSize: 14),
            )
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                context: context,
                builder: (context) {
                  return isresult
                      ? ResultBottomModelSheet()
                      : CalculatorBottomModelSheet();
                });
          },
          child: SvgPicture.asset(
            'assets/menu.svg',
          ),
        )
      ],
    );
  }
}
