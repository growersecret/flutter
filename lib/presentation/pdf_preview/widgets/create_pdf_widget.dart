import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../heiper/storing_calculation_data.dart';
import 'other_nutrients_result.dart';

Future<Uint8List> makePdf() async {
  final pdf = Document();
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/grower_pdf_logo.png'))
          .buffer
          .asUint8List());
  var totalWeight = await getString('totalWeight');
  var density = await getString('density');
  var totalN = await getString('totalN');
  var totalP = await getString('totalP');
  var totalK = await getString('totalK');
  var drymatterfromliquid = await getString('drymatterfromliquid');
  var totaldrymaterial = await getString('totaldrymaterial');
  var mixture = await getString('mixture');
  var totalDryWeight = await getString('dryweight');
  var totalpercentN = await getString('totalpercentN');
  var totalpercentP = await getString('totalpercentP');
  var totalpercentK = await getString('totalpercentK');

  pdf.addPage(Page(build: (context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(height: 100, child: Image(imageLogo)),
        ),
        Text(
          'Result:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PdfColor.fromInt(0XFFA70064),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Total Weight: ${totalWeight}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Total Density: ${density}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        SizedBox(height: 15),
        Table(
          border: TableBorder.all(color: PdfColors.black),
          children: [
            TableRow(children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text("Nutrients",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text("TDW(lbs)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text("NPK(%)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
            ]),
            TableRow(children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text("N", style: TextStyle(fontSize: 14))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(totalN, style: TextStyle(fontSize: 14))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(totalpercentN, style: TextStyle(fontSize: 14)))
            ]),
            TableRow(children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text("P", style: TextStyle(fontSize: 14))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(totalP, style: TextStyle(fontSize: 14))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(totalpercentP, style: TextStyle(fontSize: 14))),
            ]),
            TableRow(children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text("K", style: TextStyle(fontSize: 14))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(totalK, style: TextStyle(fontSize: 14))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(totalpercentK, style: TextStyle(fontSize: 14))),
            ]),
            ...otherNutrientsdata.map(
              (e) => TableRow(children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(e.name, style: TextStyle(fontSize: 14))),
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(e.percent, style: TextStyle(fontSize: 14))),
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(e.weight, style: TextStyle(fontSize: 14))),
              ]),
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text('Dry Matter/gallon water: 9',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text('Dry Matter from liquid: $drymatterfromliquid',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text('Dry material from ingredients: $totalDryWeight',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text('Total Dry material: $totaldrymaterial',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text("Mixture is: $mixture",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
      ],
    );
  }));
  return pdf.save();
}
