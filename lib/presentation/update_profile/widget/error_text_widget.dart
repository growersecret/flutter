import 'package:flutter/material.dart';
import '../../../theme/custom_theme.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({super.key, required this.errorText});
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0, left: 12.0),
      child: Text(
        errorText,
        style: CustomTheme.errorTextStyle,
      ),
    );
  }
}
