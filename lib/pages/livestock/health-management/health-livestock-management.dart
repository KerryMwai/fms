import 'package:flutter/material.dart';

import '../../../dammies/constants.dart';

class LivestockHealthManagementPage extends StatelessWidget {
  final String pagename;
  const LivestockHealthManagementPage({super.key, required this.pagename});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pagename),
        backgroundColor: blueGrey,
      ),
      body: const Center(
        child: Text("Livestock health management"),
      ),
    );
  }
}
