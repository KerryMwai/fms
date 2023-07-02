import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            if (index == 0) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const InventoryLevels()));
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
                      "Feed Inventory levels",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: green),
                    )
                  ],
                ),
              );
            } else if (index == 1) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PurchaseFeed()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/purchase.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Purchase Feed",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: green),
                    )
                  ],
                ),
              );
            } else if (index == 2) {
                return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FeedUsage()));
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
                      "Feed usage",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: green),
                    )
                  ],
                ),
              );
            } else {
               return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AddNewFeed()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/add.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Add new",
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
