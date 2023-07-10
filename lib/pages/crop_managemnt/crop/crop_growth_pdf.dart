import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_growth_model.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfw;
import 'package:printing/printing.dart';

class CropGrowthPdfPreviewPage extends StatefulWidget {
  final List<CropGrowthModel> cropgrowths;
  const CropGrowthPdfPreviewPage(
      {super.key, required this.cropgrowths});

  @override
  State<CropGrowthPdfPreviewPage> createState() =>
      _CropGrowthPdfPreviewPageState();
}

class _CropGrowthPdfPreviewPageState
    extends State<CropGrowthPdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    // Size size=MediaQuery.of(context).size;
    return Scaffold(
        
        appBar: AppBar(
          title: const Text("Crop Plans"),
        ),
        body: PdfPreview(
          // maxPageWidth:size.width,
          build: (context)=>makePdf(widget.cropgrowths))
        );
  }

  Future<Uint8List> makePdf(cropgrowths) async {
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
                    'Pheno Indicator',
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
                    'Measurement',
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
                    'Environment Data',
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
                    'Moisture level',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
            ]),
            ...cropgrowths.map((cropgrowth) => pdfw.TableRow(children: [
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(cropgrowth.crop)),
                    flex: 2,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(DateFormat('dd-MM-yy')
                                .format(cropgrowth.plantingdate!))),
                    flex: 3,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(cropgrowth.phenologicalindicator)),
                    flex: 5,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Column(children: [
                          pdfw.Text("Height: ${cropgrowth.plantheight} cm"),
                          pdfw.SizedBox(height: 10,),
                          pdfw.Text("Area: ${cropgrowth.leafarea} cm sq"),
                          pdfw.SizedBox(height: 10,),
                        ])),
                    flex: 3,
                  ),
                 pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Column(children: [
                          pdfw.Text("Temperature: ${cropgrowth.tempereture} Deg"),
                          pdfw.SizedBox(height: 10,),
                          pdfw.Text("Humidity: ${cropgrowth.humidity} mm cb"),
                          pdfw.SizedBox(height: 10,),
                          pdfw.Text("Rainfall: ${cropgrowth.rainfall} mm cb"),
                          pdfw.SizedBox(height: 10,),
                          pdfw.Text("Sunlight: ${cropgrowth.sunlight}"),
                          pdfw.SizedBox(height: 10,),
                        ])),
                    flex: 3,
                  ),

                     pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text("${cropgrowth.soilMoistureLevel} mm")),
                    flex: 3,
                  ),
                ]))
          ]);
    }));

    return pdf.save();
  }
}
