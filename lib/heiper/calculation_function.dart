import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/heiper/storing_calculation_data.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import '../presentation/calculator/calculation_screen/cubit/dry_fertilizer/dry_fertilizer_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/liquid_fertilizer/liquid_fertilizer_cubit.dart';
import '../presentation/calculator/calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';

calculate(String tdw, String liquidfertilizer, String density,
    BuildContext context) async {
//dry fertilizer details
  int index = context.read<DropdownIndexCubit>().state.dropdownindex;
  var dryPercent = context.read<DryFertilizerCubit>().state.dryFertilizer;
  int otherNutrientslength = context
      .read<OtherNutrientsCubit>()
      .state
      .otherNutrients
      .otherNutrients
      .length;
  // calculation for dry fertilizer
  num tdwofN = num.parse(tdw) *
      num.parse(dryPercent[index].percentN) /
      100; //weight of N is % of total dry weight
  saveString('tdwofN', tdwofN.toStringAsFixed(2));
  num tdwofP = num.parse(tdw) *
      num.parse(dryPercent[index].percentP) /
      100; //weight of P is % of total dry weight
  saveString('tdwofP', tdwofP.toStringAsFixed(2));
  num tdwofK = num.parse(tdw) *
      num.parse(dryPercent[index].percentK) /
      100; //weight of K is % of total dry weight
  saveString('tdwofK', tdwofK.toStringAsFixed(2));

//
//
//
//
//
//
//liquid fertilizer details
  int liquidindex = context.read<DropdownIndexCubit1>().state.dropdownindex;
  var liquidpercent =
      context.read<LiquidFertilizerCubit>().state.liquidFertilizer;

//
//
//
//
//
  //calculation for liquid fertilizer
  num tlw = num.parse(liquidfertilizer) *
      num.parse(density); //total weight of liquid fertilizer
  saveString('tlw', tlw.toStringAsFixed(2));

  num tdwoflN = tlw *
      num.parse(liquidpercent[liquidindex].percentN) /
      100; //weight of N is % of total liquid weight
  saveString('tdwoflN', tdwoflN.toStringAsFixed(2));
  num tdwoflP = tlw * num.parse(liquidpercent[liquidindex].percentP) / 100;
  //weight of P is % of total liquid weight
  saveString('tdwoflP', tdwoflP.toStringAsFixed(2));
  num tdwoflK = tlw * num.parse(liquidpercent[liquidindex].percentK) / 100;
  //weight of K is % of total liquid weight
  saveString('tdwoflK', tdwoflK.toStringAsFixed(2));

//
//
//
//
//calculation for the total mixture
  num totalweight =
      num.parse(tdw) + tlw; //total weight of dry and liquid fertilizer
  saveString('totalWeight', totalweight.toStringAsFixed(2));

  num totalN = tdwofN + tdwoflN; //total weight of N
  saveString('totalN', totalN.toStringAsFixed(2));
  num totalP = tdwofP + tdwoflP; //total weight of P
  saveString('totalP', totalP.toStringAsFixed(2));
  num totalK = tdwofK + tdwoflK; //total weight of K
  saveString('totalK', totalK.toStringAsFixed(2));

  num totalpercentN =
      totalN / totalweight * 100; //total percent of N in the mixture
  saveString('totalpercentN', totalpercentN.toStringAsFixed(2));
  num totalpercentP =
      totalP / totalweight * 100; //total percent of Pin the mixture
  saveString('totalpercentP', totalpercentP.toStringAsFixed(2));
  num totalpercentK =
      totalK / totalweight * 100; //total percent of K in the mixture
  saveString('totalpercentK', totalpercentK.toStringAsFixed(2));
  num drymatterfromliquid = num.parse(density) - 8.34;
  saveString('drymatterfromliquid', drymatterfromliquid.toStringAsFixed(2));

  num totaldrymaterial = drymatterfromliquid + num.parse(tdw);
  saveString('totaldrymaterial', totaldrymaterial.toStringAsFixed(2));

  num mixture = totaldrymaterial - 9;
  saveString('mixture', mixture.toStringAsFixed(2));
  print('index==');                   
//getting dry other nutrients value form sharedpreferences
  List dryothernutrients = [];
  List dryothernutrientsweight = [];
  for (var i = 0; i < otherNutrientslength; i++) {
    dryothernutrients.add(await getString(
        'dryothernutrients$i')); //getting the user given persentages
    print('othernutrients-->${dryothernutrients}');
    print('index==$i');

    dryothernutrientsweight.add(num.parse(tdw) *
        num.parse(dryothernutrients[i]) /
        100); //calculating the other nutrients weight from user given persentage

    saveString('dryothernutrientsweight$i',
        dryothernutrientsweight[i].toStringAsFixed(2));
  }
  //getting liquid other nutrients value form sharedpreferences
  List liquidothernutrients = [];
  List liquidothernutrientsweight = [];
  print('liqrtdothernutrients-->${liquidothernutrients.isEmpty}');
  for (var i = 0; i < otherNutrientslength; i++) {
    liquidothernutrients.add(await getString(
        'liquidothernutrients$i')); //getting the user given persentages
    liquidothernutrientsweight.add(tlw *
        num.parse(liquidothernutrients[i]) /
        100); //calculating the other nutrients weight from user given persentage

    saveString('liquidothernutrientsweight$i',
        liquidothernutrientsweight[i].toStringAsFixed(2));
  }
  //getting mixed other nutrients value form sharedpreferences
  List mixedothernutrients = [];
  List mixedothernutrientsweight = [];
  for (var i = 0; i < otherNutrientslength; i++) {
    mixedothernutrientsweight
        .add(dryothernutrientsweight[i] + liquidothernutrientsweight[i]);
    saveString('mixedothernutrientsweight$i',
        mixedothernutrientsweight[i].toStringAsFixed(2));

    mixedothernutrients.add(mixedothernutrientsweight[i] / totalweight * 100);
    saveString(
        'mixedothernutrients$i', mixedothernutrients[i].toStringAsFixed(2));
  }
}
