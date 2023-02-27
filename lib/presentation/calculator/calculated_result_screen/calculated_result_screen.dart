import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/heiper/storing_calculation_data.dart';
import 'package:grower/presentation/calculator/calculated_result_screen/widget/result_text_widget.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/liquid_fertilizer/liquid_fertilizer_cubit.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/fertilizer_container.dart';
import 'package:grower/presentation/calculator/widgets/alert_dialog_widget.dart';
import 'package:grower/presentation/calculator/widgets/dot_header_widget.dart';
import '../../../theme/custom_theme.dart';
import '../../update_profile/cubit/user_details/user_details_cubit.dart';
import '../../widgets/custom_appbar_widget.dart';
import '../calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import '../calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';
import '../calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';
import 'widget/bottom_options_widgets.dart';
import 'widget/calculation_data.dart';
import 'widget/fertilizer_result_widget.dart';

class CalculatedResultScreen extends StatefulWidget {
  const CalculatedResultScreen({super.key});

  @override
  State<CalculatedResultScreen> createState() => _CalculatedResultScreenState();
}

class _CalculatedResultScreenState extends State<CalculatedResultScreen> {
  late Map<String, dynamic> data;
  String? totalDryWeight;
  String? totalLiquidWeight;
  String? density;
  String? tdwofN;
  String? tdwofP;
  String? tdwofK;
  String? totalWeight;
  String? tdwoflN;
  String? tdwoflP;
  String? tdwoflK;
  String? totalN;
  String? totalP;
  String? totalK;
  String? drymatterfromliquid;
  String? totaldrymaterial;
  String? mixture;
  String? totalpercentN;
  String? totalpercentP;
  String? totalpercentK;
  List dryothernutrients_percentage = [];
  List dryothernutrients_weight = [];
  List liquidothernutrients_percentage = [];
  List liquidothernutrients_weight = [];
  //getting the data from sharedpreferences and storing the data in the variables up
  getresult() async {
    totalDryWeight = await getString('dryweight');
    totalLiquidWeight = await getString('tlw');
    density = await getString('density');
    tdwofN = await getString('tdwofN');
    tdwofP = await getString('tdwofP');
    tdwofK = await getString('tdwofK');
    tdwoflN = await getString('tdwoflN');
    tdwoflP = await getString('tdwoflP');
    tdwoflK = await getString('tdwoflK');
    totalN = await getString('totalN');
    totalP = await getString('totalP');
    totalK = await getString('totalK');
    totalWeight = await getString('totalWeight');
    drymatterfromliquid = await getString('drymatterfromliquid');
    totaldrymaterial = await getString('totaldrymaterial');
    mixture = await getString('mixture');
    totalpercentN = await getString('totalpercentN');
    totalpercentP = await getString('totalpercentP');
    totalpercentK = await getString('totalpercentK');
    setState(() {});
  }

//getting the data of dry and liquid  nutrients and add in the list of dry and liquid nutrients list
  getothernutrients(int length) async {
    for (var i = 0; i < length; i++) {
      dryothernutrients_percentage.add(await getString('dryothernutrients$i'));
      dryothernutrients_weight
          .add(await getString('dryothernutrientsweight$i'));
      liquidothernutrients_percentage
          .add(await getString('liquidothernutrients$i'));
      liquidothernutrients_weight
          .add(await getString('liquidothernutrientsweight$i'));
      setState(() {});
    }
  }

  gettingCalculatorData() async {
    data = await getcalculatedData();
  }

  @override
  void initState() {
    super.initState();
    getresult();
    gettingCalculatorData();
    getothernutrients(context
        .read<OtherNutrientsCubit>()
        .state
        .otherNutrients
        .otherNutrients
        .length);
  }

  @override
  Widget build(BuildContext context) {
    var dryfertilizerCubit =
        context.read<DryFertilizerCubit>().state.dryFertilizer;
    var dryfertilizerIndex =
        context.watch<DropdownIndexCubit>().state.dropdownindex;
    var liquidfertilizerCubit =
        context.read<LiquidFertilizerCubit>().state.liquidFertilizer;
    var liquidfertilizerIndex =
        context.watch<DropdownIndexCubit1>().state.dropdownindex;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                  content: 'This screen will close',
                  leftBtnTitle: 'Yes, Close',
                  title: 'Are you sure you want to close?',
                  onTap: () {
                    context.goNamed('calculator', params: {
                      'profile_setup': context
                          .read<UserDetailsCubit>()
                          .state
                          .userDetails
                          .data
                          .profileSetup
                          .toString()
                    });
                  }); //will show a alert dialog if user want to close the app
            },
          );
          return shouldPop!;
        },
        child: Scaffold(
          appBar: CustomAppbarWidget( 
            appbarTitle: 'Calculated Results',
            isresult: true,
            ontapbackarrow: () {
              context.goNamed('calculator', params: {
                'profile_setup': context
                     .read<UserDetailsCubit>()
                    .state
                    .userDetails
                    .data
                    .profileSetup
                    .toString()
              });
            },
          ),
          backgroundColor: CustomTheme.bgColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DotHeaderWidget(header: 'Dry Fertilizer'), //header with dot
                  FertilizerContainer(
                      title:
                          context.watch<DropdownIndexCubit>().state.fertilizer),
                  SizedBox(height: 12),
                  Text("Total weight of dry fertilizer:",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),

                  Text("${totalDryWeight} lbs",
                      style: CustomTheme.primarytextStyle(14, FontWeight.w500)),
                  Container(
                      height: 1,
                      width: 226,
                      margin: EdgeInsets.only(top: 5),
                      color: Colors.grey),
                  SizedBox(height: 12),
                  //dry fertilizer chart widget
                  FertilizerResultWidget(                                                                                                                                                                                                  
                      type: 'dry',
                      data: dryfertilizerCubit,
                      index: dryfertilizerIndex,
                      tdwofN: tdwofN!,
                      tdwofK: tdwofK!,
                      tdwofP: tdwofP!,
                      othernutrients_percentage: dryothernutrients_percentage,
                      othernutrients_weight:
                          dryothernutrients_weight), //dry fertilizer details widget
                  SizedBox(height: 24),
                  Divider(color: CustomTheme.primaryColor, thickness: 2),
                  SizedBox(height: 24),
                  DotHeaderWidget(
                      header: "Liquid Fertilizer"), //header with dot
                  FertilizerContainer(
                      title: context
                          .watch<DropdownIndexCubit1>()
                          .state
                          .fertilizer),
                  SizedBox(height: 12),
                  Text("Total weight of liquid fertilizer:",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  Text("${totalLiquidWeight} lbs",
                      style: CustomTheme.primarytextStyle(14, FontWeight.w500)),
                  Container(
                      height: 1,
                      width: 226,
                      margin: EdgeInsets.only(top: 5),
                      color: Colors.grey),
                  SizedBox(height: 12),
                  //liquid fertilizer chart widget
                  FertilizerResultWidget(
                    type: 'liquid',
                    data: liquidfertilizerCubit,
                    index: liquidfertilizerIndex,
                    tdwofN: tdwoflN!,
                    tdwofK: tdwoflK!,
                    tdwofP: tdwoflP!,
                    othernutrients_percentage: liquidothernutrients_percentage,
                    othernutrients_weight: liquidothernutrients_weight,
                  ), //liquid fertilizer details widget
                  SizedBox(height: 24),
                  Container(
                    height: 30,
                    width: 342,
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                    decoration: CustomTheme.calculatorContianerStyle,
                    child: Text('Calculated mixture is:',
                        style:
                            CustomTheme.primarytextStyle(16, FontWeight.bold)),
                  ),
                  SizedBox(height: 30),
                  ResultTextWidget(
                      header: "Total dry + liquid fertilizer weight :",
                      result: '${totalWeight!} Ibs'),
                  ResultTextWidget(
                      header: "Density of a mixture:",
                      result: "${density!} lbs/g"),
                  //final result fertilizer chart widget
                  FertilizerResultWidget(
                      type: 'mixed',
                      data: liquidfertilizerCubit,
                      index: liquidfertilizerIndex,
                      tdwofN: totalN!,
                      tdwofK: totalK!,
                      tdwofP: totalP!,
                      totalpercentN: totalpercentN,
                      totalpercentP: totalpercentP,
                      totalpercentK:
                          totalpercentK), //total fertilizer details widget
                  SizedBox(height: 24),
                  ResultTextWidget(
                      header: "Max dry matter per gallon water",
                      result: "9 lbs"),
                  ResultTextWidget(
                      header: "Dry matter from liquid",
                      result: "$drymatterfromliquid lbs"),
                  ResultTextWidget(
                      header: "Dry material from ingredients",
                      result: "$totalDryWeight lbs"),
                  ResultTextWidget(
                      header: "Total Dry material",
                      result: "$totaldrymaterial lbs"),
                  Container(
                      width: 342,
                      padding: EdgeInsets.all(16),
                      decoration: CustomTheme.shadowDecoration,
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mixture is:',
                                  style: TextStyle(fontSize: 16)),
                              Text('$mixture lbs',
                                  style: CustomTheme.primarytextStyle(
                                      16, FontWeight.w400))
                            ]),
                        SizedBox(height: 10),
                        Text(
                            'Pounds over suggested limit of 9 pounds dry material per gallon',
                            style: TextStyle(fontSize: 14, color: Colors.red))
                      ])),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child:
                          BottomOptionsWidget()) //showing bottom icons optins
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
