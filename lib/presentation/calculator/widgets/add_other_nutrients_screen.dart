import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/storing_calculation_data.dart';
import '../../../theme/custom_theme.dart';
import '../calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';

// ignore: must_be_immutable
class AddOtherNutrientswidget extends StatefulWidget {
  AddOtherNutrientswidget({super.key, required this.type});
  final String type;

  @override
  State<AddOtherNutrientswidget> createState() =>
      _AddOtherNutrientswidgetState();
}

class _AddOtherNutrientswidgetState extends State<AddOtherNutrientswidget> {
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List othernutrients_percentage = [];

  getothernutrients(int length) async {
    for (var i = 0; i < length; i++) {
      othernutrients_percentage
          .add(await getString('${widget.type}othernutrients$i'));
      setState(() {});
    }
  }

  @override
  void initState() {
    getothernutrients(context
        .read<OtherNutrientsCubit>()
        .state
        .otherNutrients
        .otherNutrients
        .length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var otherNutrients = context
        .watch<OtherNutrientsCubit>()
        .state
        .otherNutrients
        .otherNutrients;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: AlertDialog(
                contentPadding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: Container(
                    height: 30,
                    width: 342.w,
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('Add your other nutrients in (%)',
                        style: TextStyle(color: Colors.black, fontSize: 16)))),
          ),
          Positioned(
            top: 170,
            left: 20,
            right: 20,
            child: AlertDialog(
                contentPadding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: Container(
                    width: 342,
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        // height: 55 * otherNutrients.length.toDouble(),
                        height: 55 * 5,
                        child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: otherNutrients.length,
                            itemBuilder: (context, index) {
                              return Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: SizedBox(
                                              width: 100,
                                              child: TextFormField(
                                                  controller:
                                                      _controllers[index],
                                                  textAlign: TextAlign.right,
                                                  cursorColor: CustomTheme
                                                      .primaryColor,
                                                  keyboardType: TextInputType
                                                      .number,
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets
                                                              .only(
                                                                  bottom: 0,
                                                                  top: 25,
                                                                  right: 10),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: CustomTheme
                                                                  .primaryColor)),
                                                      prefixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0),
                                                        child: Text(
                                                          otherNutrients[index]
                                                              .name,
                                                          style: TextStyle(
                                                              color: CustomTheme
                                                                  .primaryColor,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                      hintText:
                                                          othernutrients_percentage[
                                                                      index]
                                                                  .toString()
                                                                  .isEmpty
                                                              ? '0'
                                                              : othernutrients_percentage[
                                                                  index]))))
                                    ])
                              ]);
                            })))),
          ),
          Positioned(
            top: 530,
            left: 20,
            right: 20,
            child: AlertDialog(
                contentPadding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                content: InkWell(
                    onTap: () {
                      for (var i = 0; i < otherNutrients.length; i++) {
                        saveString(
                            '${widget.type}othernutrients${i}',
                            _controllers[i].text.isEmpty
                                ? '0'
                                : _controllers[i].text);
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 150.w,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text('Continue',
                                style: TextStyle(
                                    color: CustomTheme.primaryColor,
                                    fontSize: 16)))))),
          )
        ],
      ),
    );
  }
}
