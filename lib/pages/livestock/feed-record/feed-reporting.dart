import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/feed-record/reporting/feed_usage_report.dart';
import 'package:fms/pages/livestock/feed-record/reporting/inventory_levels_report.dart';

class FeedReportingPage extends StatelessWidget {
  const FeedReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing:   10,
            childAspectRatio: 2/2.5,
            crossAxisCount: 2), 
        itemBuilder: (context, index){
          if(index==0){
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FeedUsageReport()));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: size.width * 0.33,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("asset/images/record.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Feed Usage Report",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: green),
                      )
                    ],
                  ),
                );
          }else{
             return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>const InventoryLevelsReport()));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: size.width * 0.33,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("asset/images/level.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Inventory Levels Report",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: green),
                      )
                    ],
                  ),
                );
          }
        }),
    );
  }
}