import 'package:flutter/material.dart';

class FertilizerContainer extends StatelessWidget {
  const FertilizerContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 342,
      padding: EdgeInsets.only(top: 18, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0.5),
            blurRadius: 0.03,
            spreadRadius: 0.03,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
