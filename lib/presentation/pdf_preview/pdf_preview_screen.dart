import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';
import '../../theme/custom_theme.dart';
import '../calculator/calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';
import 'widgets/other_nutrients_result.dart';
import 'widgets/create_pdf_widget.dart';

class PdfPreviewScreen extends StatefulWidget {
  const PdfPreviewScreen({super.key});

  @override
  State<PdfPreviewScreen> createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  @override
  void initState() {
    addnutrients(context
        .read<OtherNutrientsCubit>()
        .state
        .otherNutrients
        .otherNutrients);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CustomTheme.primaryColor,
            )),
        title: Container(
          height: 34,
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: CustomTheme.greylight,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/grower_logo.png',
                height: 30,
              ),
              Text(
                'Pdf Preview',
                style: TextStyle(color: CustomTheme.primaryColor, fontSize: 14),
              )
            ],
          ),
        ),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }
}
