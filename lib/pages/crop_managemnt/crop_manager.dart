import 'package:flutter/material.dart';
import 'package:fms/pages/crop_managemnt/crop/records_growth_stages.dart';
import 'package:fms/pages/crop_managemnt/crop/view_crop_plans.dart';
import 'package:fms/pages/crop_managemnt/field/alerts_and_notifications.dart';
import 'package:fms/pages/crop_managemnt/field/field_information.dart';
import 'package:fms/pages/crop_managemnt/field/weather_information.dart';

class CropManager extends StatefulWidget {
  const CropManager({super.key});

  @override
  State<CropManager> createState() => _CropManagerState();
}

class _CropManagerState extends State<CropManager> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 5,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          if (index == 1) {
            return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CropPlansPage())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("View Crop Plans")),
                ),
              ),
            );
          }else if (index == 2) {
            return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CropGrowthRecords())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Crop Growth Records")),
                ),
              ),
            );
          } else if (index == 3) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const FieldInformationPage())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Field Information")),
                ),
              ),
            );
          } else if (index == 4) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const WeatherInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Weather Information")),
                ),
              ),
            );
          } else {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CropsAlertNotificationTable())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Alerts and Notifications")),
                ),
              ),
            );
          }
        });
  }
}
// CropsAlertNotificationTable