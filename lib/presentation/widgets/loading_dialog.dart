import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grower/theme/custom_theme.dart';

loadingDialog(
  BuildContext context,
) {
  if (!Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
       Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
         });
        return CupertinoAlertDialog(
          content: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'loading..',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    );
  } else {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'loading..',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
