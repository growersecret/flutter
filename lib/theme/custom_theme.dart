import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomTheme {
  //colors
  static const Color primaryColor = Color(0XFFA70064);
  static const Color seconderyColor = Color(0XFFCA66A2);
  static const Color bgColor = Color(0XFFF0F6FF);
  static const Color greylight = Color(0XFFE7E7E7);
  static const Color greyshade1 = Color(0XFF2F3237);
  static const Color textColor = Color(0XFF2F3237);
  static const Color redErrorColor = Color(0XFFFF1515);

//font size for the app
  static const Map<String, double> fontsize = {"sm": 14, "md": 17, "lg": 24};

//textformfield style
  static textFieldStyle(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: CustomTheme.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: CustomTheme.primaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: CustomTheme.primaryColor, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: CustomTheme.primaryColor, width: 2),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 187, 187, 187),
      ),
    );
  }

//main button decoration
  static btnDecaration(Color color) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(30));
  }

//container decoration that wrap the textfield and give
//it a box shadow and border in calculator screen
  static var calculatorContianerStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(color: Colors.white),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 0.5),
          blurRadius: 0.05,
          spreadRadius: 0.05,
        ),
      ]);

  static calculatorTextStyle(String hintText) {
    return InputDecoration(
        contentPadding: EdgeInsets.only(right: 10),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: UnderlineInputBorder(borderSide: BorderSide.none));
  }

//otp pin theme
  static final pintheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: CustomTheme.seconderyColor.withOpacity(0.3),
      border: Border.all(color: CustomTheme.seconderyColor.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

//result screen decoration
  static final shadowDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(color: Colors.white),
      boxShadow: [
        BoxShadow(
          color: Colors.blue[100]!,
          offset: Offset(3.5, 4),
          blurRadius: 10,
          spreadRadius: 0.4,
        ),
      ]);

//pink text style
  static primarytextStyle(double fontsize, FontWeight fontweight) {
    return TextStyle(
        fontSize: fontsize, color: primaryColor, fontWeight: fontweight);
  }

//error textStyle
  static final errorTextStyle = TextStyle(color: redErrorColor, fontSize: 10);
}
