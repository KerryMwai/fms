import 'package:flutter/material.dart';
import 'package:fms/pages/livestock/feed-record/feed-management/add_new_feed.dart';
import 'package:fms/pages/livestock/feed-record/feed-management/inventory_levels.dart';
import 'package:fms/pages/livestock/feed-record/feed-management/purchase.dart';
import 'package:fms/pages/livestock/feed-record/feed-management/usage.dart';

class FeedManagementPage extends StatefulWidget {
  const FeedManagementPage({super.key});

  @override
  State<FeedManagementPage> createState() => _FeedManagementPageState();
}

class _FeedManagementPageState extends State<FeedManagementPage> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index){
        if(index==0){
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const InventoryLevels())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Center(child: Text("Feed Inventory levels")),
                  ),
          );
        }else if(index==1){
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const PurchaseFeed())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Center(child: Text("Purchase Feed")),
                  ),
          );
        }else if(index==2){
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const FeedUsage())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Center(child: Text("Feed usage")),
                  ),
          );
        }else{
          return GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddNewFeed())),
            child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Center(child: Text("Add new")),
                  ),
          );
        }
      });
  }
}