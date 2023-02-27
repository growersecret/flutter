import 'package:flutter/material.dart';

class SuccessPopUpWidget extends StatelessWidget {
  const SuccessPopUpWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 350,
        width: 350,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/tick.png'),
            const SizedBox(
              height: 20,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
