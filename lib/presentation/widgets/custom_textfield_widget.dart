import 'package:flutter/material.dart';
import '../../theme/custom_theme.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    super.key,
    required this.hinttext,
    this.onChanged,
    required this.ontap,
    required this.validator,
    required this.controller,
    this.maxline = 1,
    // this.maxlength,
    this.inputType,
    this.readOnly = false,
    required this.isfocused,
  });

  final String hinttext;
  VoidCallback ontap;
  final bool isfocused;
  final FormFieldValidator<String> validator;
  ValueChanged<String>? onChanged;
  final TextEditingController controller;
  int? maxline;

  // int? maxlength;
  TextInputType? inputType;
  bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: isfocused
            ? [
                BoxShadow(
                  color: CustomTheme.seconderyColor.withOpacity(0.8),
                  offset: Offset(0, 0),
                  spreadRadius: 0.0,
                  blurRadius: 12,
                ),
              ]
            : [],
      ),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        readOnly: readOnly,
        controller: controller,
        maxLines: maxline,
        // maxLength: maxlength,
        keyboardType: inputType,
        cursorColor: CustomTheme.primaryColor,
        decoration: CustomTheme.textFieldStyle(hinttext),
        onTap: ontap,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
