import 'package:flutter/material.dart';

import 'feed-livestock-management/add_livestock_feed_type.dart';
import 'feed-livestock-management/feed_consumption_history.dart';
import 'feed-livestock-management/feed_schedule.dart';

class LivestockFeedManagement extends StatefulWidget {
  const LivestockFeedManagement({super.key});

  @override
  State<LivestockFeedManagement> createState() => _LivestockFeedManagementState();
}

class _LivestockFeedManagementState extends State<LivestockFeedManagement> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index){
        if(index==0){
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddLiveStockFeedType())),
            child: const Card(
              
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("Listock and its type of feed")),
            ),
                  ),
          );
        }else if(index==1){
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const FeedConsumptionHistory())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("Feed consumption History")),
            ),
                  ),
          );
        }else {
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const FeedingSchedule())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: Text("Setup Feeding Schedule")),
            ),
                  ),
          );
        }
      });
  }
}