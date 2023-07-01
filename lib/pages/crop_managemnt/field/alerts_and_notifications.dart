import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/field/sett_notification.dart';

class AlertNotification {
  final String fieldName;
  final String alertType;
  final DateTime timestamp;
  final String message;

  AlertNotification({
    required this.fieldName,
    required this.alertType,
    required this.timestamp,
    required this.message,
  });
}

class CropsAlertNotificationTable extends StatelessWidget {
  final List<AlertNotification> alertNotifications = generateDummyData(10);

  CropsAlertNotificationTable({super.key});

  static List<AlertNotification> generateDummyData(int count) {
    List<AlertNotification> data = [];

    for (int i = 0; i < count; i++) {
      AlertNotification alert = AlertNotification(
        fieldName: 'Field ${i + 1}',
        alertType: 'Alert ${i + 1}',
        timestamp: DateTime.now().subtract(Duration(minutes: i * 15)),
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      );

      data.add(alert);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Alerts and Notifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(width: 1.0, color: Colors.black),
            children: [
              const TableRow(
                decoration: BoxDecoration(color: Colors.grey),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text('Field', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text('Alert Type', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text('Timestamp', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TableCell(child: Center(child: Text('Message', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))),
                  ),
                ],
              ),
              for (var notification in alertNotifications)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Center(child: Text(notification.fieldName))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Center(child: Text(notification.alertType))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Center(child: Text(notification.timestamp.toString()))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Center(child: Text(notification.message))),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SetAlert()));
      }, child:const  Icon(Icons.add),),
    );
  }
}
