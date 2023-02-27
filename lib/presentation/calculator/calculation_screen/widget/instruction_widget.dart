import 'package:flutter/material.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions:',
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 5,
              width: 5,
              margin: EdgeInsets.only(right: 10, top: 5, left: 7),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
            ),
            Text(
              'We do not recommend adding more than a 1:1\n ratio of dry fertilizer to water.',
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 5,
              width: 5,
              margin: EdgeInsets.only(right: 10, top: 5, left: 7),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
            ),
            Text(
              'Less than a 1:1 ratio of dry fertilizer to liquids\nwith other dissolved materials.',
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
