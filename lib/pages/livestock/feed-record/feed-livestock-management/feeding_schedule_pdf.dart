import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_schedule_model.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfw;
import 'package:printing/printing.dart';

class FeedSchedulePdfPreviewPage extends StatefulWidget {
  final List<FeedScheduleModel> feedschedule;
  const FeedSchedulePdfPreviewPage(
      {super.key, required this.feedschedule});

  @override
  State<FeedSchedulePdfPreviewPage> createState() =>
      _FeedSchedulePdfPreviewPageState();
}

class _FeedSchedulePdfPreviewPageState
    extends State<FeedSchedulePdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    // Size size=MediaQuery.of(context).size;
    return Scaffold(
        
        appBar: AppBar(
          title: const Text("Feed Schedule Pdf"),
        ),
        body: PdfPreview(
          // maxPageWidth:size.width,
          build: (context)=>makePdf(widget.feedschedule))
        );
  }

  Future<Uint8List> makePdf(feedhistories) async {
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
                    'Livestock ID',
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
                    'Breed',
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
                    'Feeding Interval',
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
                    'Feed name',
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
                    'Feed type',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
              pdfw.Expanded(
                flex: 11,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Quantity',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
              pdfw.Expanded(
                flex: 18,
                child: pdfw.Padding(
                  padding: const pdfw.EdgeInsets.all(20),
                  child: pdfw.Text(
                    'Feeding Method',
                    style: const pdfw.TextStyle(
                        color: PdfColors.black, fontSize: 20),
                    textAlign: pdfw.TextAlign.center,
                  ),
                ),
              ),
            ]),
            ...feedhistories.map((feed) => pdfw.TableRow(children: [
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(feed.livestockid)),
                    flex: 2,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(feed.livestocktype)),
                    flex: 3,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(
                            "${DateFormat("h:mm a").format(feed.feedingintervalfrom)} — ${DateFormat("h:mm a").format(feed.feedingintervalto)}")),
                    flex: 2,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(feed.feedname)),
                    flex: 3,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(feed.feedtype)),
                    flex: 3,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text("${feed.feedquantity} Kgs")),
                    flex: 2,
                  ),
                  pdfw.Expanded(
                    child: pdfw.Padding(
                        padding: const pdfw.EdgeInsets.all(15),
                        child: pdfw.Text(feed.feedingmethod)),
                    flex: 5,
                  )
                ]))
          ]);
    }));

    return pdf.save();
  }
}
