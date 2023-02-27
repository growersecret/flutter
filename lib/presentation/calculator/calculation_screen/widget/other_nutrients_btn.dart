import 'package:flutter/material.dart';

import '../../../../theme/custom_theme.dart';

class OtherNutrientsBtnWidget extends StatelessWidget {
  const OtherNutrientsBtnWidget(
      {super.key, required this.onTap, required this.active});
  final VoidCallback onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 117,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:
                active ? CustomTheme.primaryColor : CustomTheme.seconderyColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0.5,
              ),
            ]),
        child: const Center(
            child: Text(
          'Other nutrients',
          style: TextStyle(color: Colors.white, fontSize: 14),
        )),
      ),
    );
  }
}
