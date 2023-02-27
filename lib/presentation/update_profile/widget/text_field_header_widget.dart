import 'package:flutter/material.dart';

class TextFieldHeaderWidget extends StatelessWidget {
  const TextFieldHeaderWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
