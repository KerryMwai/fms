import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_model.dart';
class FeedConsumptionHistoryPdfPreviewPage extends StatefulWidget {
  final List<FeedModel> feedModel;
  const FeedConsumptionHistoryPdfPreviewPage({super.key, required this.feedModel});

  @override
  State<FeedConsumptionHistoryPdfPreviewPage> createState() => _FeedConsumptionHistoryPdfPreviewPageState();
}

class _FeedConsumptionHistoryPdfPreviewPageState extends State<FeedConsumptionHistoryPdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed Consumption History"),
      ),
      
    );
  }
}