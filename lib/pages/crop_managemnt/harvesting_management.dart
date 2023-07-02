import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/equipment/equipment_assignment_information.dart';
import 'package:fms/pages/crop_managemnt/harvesting/harvesting_information.dart';
import 'package:fms/pages/crop_managemnt/harvesting/harvesting_schedule_information.dart';
import 'package:fms/pages/crop_managemnt/harvesting/workforce_or_machine_field_crop_assignment_information.dart';
import 'package:fms/pages/crop_managemnt/labor/labor_management_information.dart';

class HarvestingManager extends StatefulWidget {
  const HarvestingManager({super.key});

  @override
  State<HarvestingManager> createState() => _HarvestingManagerState();
}

class _HarvestingManagerState extends State<HarvestingManager> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          itemCount: 5,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3,
                crossAxisSpacing: 10
                ),
          itemBuilder: (context, index) {
            if (index == 1) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HarvestingInformation()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/harvestinfor.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Harvesting Information",
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const WorkforceMachineFieldCropAssignmentInformation()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/assignment.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Harvesting Crop Field Assignments",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: green),
                    )
                  ],
                ),
              );
            } else if (index == 3) {
               return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HarvestingScheduleInformation()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/schedule.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Harvesting Schedules",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: green),
                    )
                  ],
                ),
              );
            
            }
            if (index == 4) {
                 return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const EquipmentAssignmentInformation()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/eassignment.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Equipment assignment information",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: green),
                    )
                  ],
                ),
              );
              
            } else {
    // Equipment management
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LaborManagementInformation()));
                },
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.33,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("asset/images/laborm.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Labor Management",
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
