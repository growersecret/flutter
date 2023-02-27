import 'package:flutter/material.dart';
import '../../../../theme/custom_theme.dart';

// ignore: must_be_immutable
class CalculatorTextFieldWidget extends StatelessWidget {
  CalculatorTextFieldWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.ontap});
  final String title;
  final String hintText;
  final TextEditingController controller;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 54,
            // width: 95,
            decoration: CustomTheme.calculatorContianerStyle,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: CustomTheme.primaryColor, fontSize: 14)),
                  Container(
                      margin: const EdgeInsets.only(top: 3),
                      height: 2,
                      width: 50,
                      decoration:
                          BoxDecoration(color: CustomTheme.primaryColor))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 7,
          child: Container(
            // width: 193.w,
            height: 54,
            decoration: CustomTheme.calculatorContianerStyle,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.right,
              cursorColor: CustomTheme.primaryColor,
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.digitsOnly
              // ],
              onTap: ontap,
              decoration: CustomTheme.calculatorTextStyle(hintText),
            ),
          ),
        )
      ],
    );
  }
}
