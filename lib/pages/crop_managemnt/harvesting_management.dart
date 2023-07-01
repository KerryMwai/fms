import 'package:flutter/material.dart';
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
    return GridView.builder(
        itemCount: 5,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          if (index == 1) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HarvestingInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Harvesting Information")),
                ),
              ),
            );
          } else if (index == 2) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          const WorkforceMachineFieldCropAssignmentInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child:
                      Center(child: Text("Harvesting Crop Field Assignments")),
                ),
              ),
            );
          } else if (index == 3) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HarvestingScheduleInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Harvesting Schedules")),
                ),
              ),
            );
          } if(index==4) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const EquipmentAssignmentInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Equipment Assignment Information")),
                ),
              ),
            );
          }else{
             return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LaborManagementInformation())),
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: Text("Labor Management")),
                ),
              ),
            );
          }
        });
  }
}
