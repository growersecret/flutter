import 'package:flutter/material.dart';
import '../../../theme/custom_theme.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomTheme.greylight,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintText: email,
        ),
      ),
    );
  }
}
