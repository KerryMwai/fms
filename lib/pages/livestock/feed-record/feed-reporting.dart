import 'package:flutter/material.dart';
import 'package:fms/pages/livestock/feed-record/reporting/feed_usage_report.dart';
import 'package:fms/pages/livestock/feed-record/reporting/inventory_levels_report.dart';

class FeedReportingPage extends StatelessWidget {
  const FeedReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index){
        if(index==0){
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const FeedUsageReport())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Center(child: Text("Feed Usage Report")),
                  ),
          );
        }else{
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const InventoryLevelsReport())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Center(child: Text("Inventory Levels Report")),
                  ),
          );
        }
      });
  }
}