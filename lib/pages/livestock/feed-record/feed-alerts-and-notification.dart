import 'package:flutter/material.dart';

class FeedAlertsAndNotificationPage extends StatelessWidget {
  const FeedAlertsAndNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:const Text("Feed Alert and notification"),
        centerTitle: true,
      ),
      body:const Text("Feed Alert and notification") ,
    );
  }
}