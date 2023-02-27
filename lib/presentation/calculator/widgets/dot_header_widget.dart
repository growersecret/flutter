import 'package:flutter/material.dart';
import '../../../theme/custom_theme.dart';

class DotHeaderWidget extends StatelessWidget {
  const DotHeaderWidget({super.key, required this.header});
  final String header;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
                color: CustomTheme.primaryColor,
                borderRadius: BorderRadius.circular(50)),
          ),
          const SizedBox(width: 5),
          Text(header,
              style: CustomTheme.primarytextStyle(16, FontWeight.bold)),
        ],
      ),
    );
  }
}
