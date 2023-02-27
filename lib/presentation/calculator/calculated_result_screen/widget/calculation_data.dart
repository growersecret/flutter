import '../../../../heiper/storing_calculation_data.dart';

Future<Map<String, dynamic>> getcalculatedData() async {
  var totalDryWeight = await getString('dryweight');

  var totalLiquidWeight = await getString('tlw');

  var density = await getString('density');

  var tdwofN = await getString('tdwofN');

  var tdwofP = await getString('tdwofP');

  var tdwofK = await getString('tdwofK');

  var tdwoflN = await getString('tdwoflN');

  var tdwoflP = await getString('tdwoflP');

  var tdwoflK = await getString('tdwoflK');

  var totalN = await getString('totalN');

  var totalP = await getString('totalP');

  var totalK = await getString('totalK');

  var totalWeight = await getString('totalWeight');

  var drymatterfromliquid = await getString('drymatterfromliquid');

  var totaldrymaterial = await getString('totaldrymaterial');

  var mixture = await getString('mixture');

  var totalpercentN = await getString('totalpercentN');

  var totalpercentP = await getString('totalpercentP');

  var totalpercentK = await getString('totalpercentK');

  return {
    'totalDryWeight': totalDryWeight,
    'totalLiquidWeight': totalLiquidWeight,
    'density': density,
    'tdwofN': tdwofN,
    'tdwofP': tdwofP,
    'tdwofK': tdwofK,
    'tdwoflN': tdwoflN,
    'tdwoflP': tdwoflP,
    'tdwoflK': tdwoflK,
    'totalN': totalN,
    'totalP': totalP,
    'totalK': totalK,
    'totalWeight': totalWeight,
    'drymatterfromliquid': drymatterfromliquid,
    'totaldrymaterial': totaldrymaterial,
    'mixture': mixture,
    'totalpercentN': totalpercentN,
    'totalpercentP': totalpercentP,
    'totalpercentK': totalpercentK,
  };
}
