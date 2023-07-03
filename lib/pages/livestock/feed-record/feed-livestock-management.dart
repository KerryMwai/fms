import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';

import 'feed-livestock-management/feed_consumption_history.dart';
import 'feed-livestock-management/feed_schedule_information.dart';

class LivestockFeedManagement extends StatefulWidget {
  const LivestockFeedManagement({super.key});

  @override
  State<LivestockFeedManagement> createState() =>
      _LivestockFeedManagementState();
}

class _LivestockFeedManagementState extends State<LivestockFeedManagement> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 2 / 2.5,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
         if (index == 0) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FeedConsumptionHistory()));
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
                      "Feed consumption History",
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FeedScheduleInformation()));
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
                      "Livestock Feeding Schedule Information",
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
