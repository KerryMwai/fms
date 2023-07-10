import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_plan_model.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfw;
import 'package:printing/printing.dart';

class CropPlansPdfPreviewPage extends StatefulWidget {
  final List<CropPlan> cropplans;
  const CropPlansPdfPreviewPage(
      {super.key, required this.cropplans});

  @override
  State<CropPlansPdfPreviewPage> createState() =>
      _CropPlansPdfPreviewPageState();
}

class _CropPlansPdfPreviewPageState
    extends State<CropPlansPdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    // Size size=MediaQuery.of(context).size;
    return Scaffold(
        
        appBar: AppBar(
          title: const Text("Crop Plans"),
        ),
        body: PdfPreview(
          // maxPageWidth:size.width,
          build: (context)=>makePdf(widget.cropplans))
        );
  }

  Future<Uint8List> makePdf(cropplans) async {
    final pdf = pdfw.Document();
    pdf.addPage(pdfw.Page(build: (context) {
      return pdfw.Table(
          border: pdfw.TableBorder.all(color: PdfColors.black),
          children: [
            pdfw.TableRow(children: [
              pdfw.Expanded(
                flex: 20,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Crop',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
              pdfw.Expanded(
                flex: 13,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Planting Date',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
              pdfw.Expanded(
                flex: 16,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Spacing',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
              pdfw.Expanded(
                flex: 15,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Fertilizer',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
              pdfw.Expanded(
                flex: 13,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Pest Management',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
            ]),
            ...cropplans.map((plan) => pdfw.TableRow(children: [
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(plan.crop)),
                    flex: 2,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(DateFormat('dd-MM-yy')
                                .format(plan.plantingDate!))),
                    flex: 3,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text("${plan.spacing} m")),
                    flex: 2,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(plan.fertilizertype!)),
                    flex: 3,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(plan.fertilizername!)),
                    flex: 3,
                  ),
                ]))
          ]);
    }));

    return pdf.save();
  }
}
