import 'package:flutter/material.dart';

import '../../../dammies/constants.dart';

class LivestockHealthMonitoringPage extends StatelessWidget {
  final String pagename;
  const LivestockHealthMonitoringPage({super.key, required this.pagename});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pagename),
        backgroundColor: blueGrey,
      ),
      body: const Center(
        child: Text("Livestock health Monitoring"),
      ),
    );
  }
}
