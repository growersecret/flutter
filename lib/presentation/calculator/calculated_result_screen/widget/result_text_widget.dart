import 'package:flutter/cupertino.dart';
import '../../../../theme/custom_theme.dart';

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget(
      {super.key, required this.header, required this.result});
  final String header;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 12),
        Text(
          result,
          style: CustomTheme.primarytextStyle(14, FontWeight.w500),
        ),
        Container(
            height: 1,
            width: 342,
            margin: EdgeInsets.only(top: 5),
            color: CustomTheme.primaryColor),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
