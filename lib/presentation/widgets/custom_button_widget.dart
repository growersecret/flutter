import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/custom_theme.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.isValid,
      required this.btnTitle,
      required this.onBtnPress});
  final bool isValid;
  final String btnTitle;
  final VoidCallback onBtnPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBtnPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10),
        height: 50,
        width: 280.w,
        decoration: CustomTheme.btnDecaration(
            isValid ? CustomTheme.primaryColor : CustomTheme.seconderyColor),
        child: Center(
          child: Text(
            btnTitle,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
