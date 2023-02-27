import 'package:flutter/material.dart';

class ShowToastMessage extends StatelessWidget {
  const ShowToastMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      content: Container(
        width: 275,
        height: 50,
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.check_circle, color: Colors.green, size: 30),
            ),
            Text('Otp has been resent',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
