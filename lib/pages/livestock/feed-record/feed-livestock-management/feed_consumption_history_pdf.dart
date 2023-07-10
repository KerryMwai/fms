import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_model.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfw;

class FeedConsumptionHistoryPdfPreviewPage extends StatefulWidget {
  final List<FeedModel> feedModel;
  const FeedConsumptionHistoryPdfPreviewPage(
      {super.key, required this.feedModel});

  @override
  State<FeedConsumptionHistoryPdfPreviewPage> createState() =>
      _FeedConsumptionHistoryPdfPreviewPageState();
}

class _FeedConsumptionHistoryPdfPreviewPageState
    extends State<FeedConsumptionHistoryPdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Feed Consumption History"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                border: TableBorder.all(),
                columns: const [
                  DataColumn(label: Text('Livestock ID')),
                  DataColumn(label: Text('Breed')),
                  DataColumn(label: Text('Animal Weight')),
                  DataColumn(label: Text('Feed name')),
                  DataColumn(label: Text('Feed type')),
                  DataColumn(label: Text('Quantity/day')),
                  DataColumn(label: Text('Feeding Method')),
                  DataColumn(label: Text('Date')),
                ],
                rows: widget.feedModel.map((document) {
                  return DataRow(cells: [
                    DataCell(Text(document.livestockid)),
                    DataCell(Text(document.livestockname)),
                    DataCell(Text("${document.animalweight} Kgs")),
                    DataCell(Text(document.feedname)),
                    DataCell(Text(document.feedtype)),
                    DataCell(Text("${document.quantityaday} Kgs")),
                    DataCell(Text(document.feedingmethod)),
                    DataCell(
                        Text(DateFormat("dd-MMMM-yyyy").format(document.date))),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ));
  }

  Future<Uint8List> makePdf(feedhistories) async {
    final pdf = pdfw.Document();
    pdf.addPage(pdfw.Page(build: (context) {
      return pdfw.Table(
          border: pdfw.TableBorder.all(color: PdfColors.black),
          children: [
            pdfw.TableRow(
              children: [
              pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Livestock ID',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
              pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Breed',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
             pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Animal Weight',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
               pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Feed name',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
               pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Feed type',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
               pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Quantity/day',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
               pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Feeding Method',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
            
               pdfw.Expanded(
                flex: 2,
                child: pdfw.Padding(
                padding: const pdfw.EdgeInsets.all(20),
                child: pdfw.Text(
                  'Date',
                  style: const pdfw.TextStyle(
                      color: PdfColors.black, fontSize: 20),
                  textAlign: pdfw.TextAlign.center,
                ),
              ),),
            ]),

            ...feedhistories.map((feed)=>pdfw.TableRow(children: [
               pdfw.Expanded(
            child: pdfw.Padding(padding:const  pdfw.EdgeInsets.all(15)),
            flex: 2,
          ),
            ]))
          ]);
    }));
  }
}

