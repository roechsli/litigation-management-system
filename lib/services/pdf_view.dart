import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PdfView(
      controller: PdfController(
        document: PdfDocument.openAsset(
            '2023_Report_End_of_Year_DEMO.pdf'),
      ),
    );
  }

}