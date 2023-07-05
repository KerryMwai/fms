import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop/records_growth_stages.dart';
import 'package:fms/pages/crop_managemnt/crop/view_crop_plans.dart';

class CropManager extends StatefulWidget {
  const CropManager({super.key});

  @override
  State<CropManager> createState() => _CropManagerState();
}

class _CropManagerState extends State<CropManager> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 2 / 3),
          itemBuilder: (context, index) {
            if (index == 0) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CropPlansPage()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/plans.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "View Crop Plans",
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
                          builder: (context) => CropGrowthRecords()));
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
                      "Crop Growth Records",
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
// CropsAlertNotificationTable
