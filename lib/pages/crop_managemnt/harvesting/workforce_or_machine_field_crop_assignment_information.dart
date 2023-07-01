import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/add_harvest_crop_field_assignment.dart';
class WorkforceMachineFieldCropAssignmentInformation extends StatefulWidget {
  const WorkforceMachineFieldCropAssignmentInformation({super.key});

  @override
  State<WorkforceMachineFieldCropAssignmentInformation> createState() => _WorkforceMachineFieldCropAssignmentInformationState();
}

class _WorkforceMachineFieldCropAssignmentInformationState extends State<WorkforceMachineFieldCropAssignmentInformation> {
  List<Map<String, dynamic>> generateDummyData() {
  List<String> fields = ['Field 1', 'Field 2', 'Field 3', 'Field 4', 'Field 5'];
  List<String> crops = ['Corn', 'Wheat', 'Soybean', 'Rice', 'Potato'];
  List<String> workforceMachines = ['Workers', 'Machines', 'Workers', 'Machines', 'Workers'];
  List<String> workloadTasks = [
    'Planting, Harvesting',
    'Plowing, Irrigation, Harvesting',
    'Weeding, Fertilization',
    'Watering, Pesticide spraying',
    'Harvesting, Sorting'
  ];
  List<String> timeframes = ['March - July', 'October - June', 'April - September', 'May - October', 'June - November'];
  List<String> skills = [
    'Experience in corn farming',
    'Operate wheat-specific machinery',
    'Knowledge of soybean cultivation',
    'Paddy field management expertise',
    'Sorting and grading skills'
  ];

  Random random = Random();
  List<Map<String, dynamic>> dummyData = [];

  for (int i = 0; i < 10; i++) {
    int fieldIndex = random.nextInt(fields.length);
    int cropIndex = random.nextInt(crops.length);
    int workforceMachineIndex = random.nextInt(workforceMachines.length);
    int workloadTaskIndex = random.nextInt(workloadTasks.length);
    int timeframeIndex = random.nextInt(timeframes.length);
    int skillIndex = random.nextInt(skills.length);

    dummyData.add({
      'fieldCropDetails': '${fields[fieldIndex]} - ${crops[cropIndex]}',
      'workforceMachine': workforceMachines[workforceMachineIndex],
      'workloadTaskRequirement': workloadTasks[workloadTaskIndex],
      'timeframe': timeframes[timeframeIndex],
      'skills': skills[skillIndex],
    });
  }

  return dummyData;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Fields Assignment Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
          columnSpacing: 8.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          columns: [
            DataColumn(
              label: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Field/Crop Details',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Workforce/Machine',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Workload/Task Requirement',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Timeframe',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Skills',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
          rows: generateDummyData()
              .map((assignment) => DataRow(
                    cells: [
                      DataCell(Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(assignment['fieldCropDetails']),
                      )),
                      DataCell(Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(assignment['workforceMachine']),
                      )),
                      DataCell(Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(assignment['workloadTaskRequirement']),
                      )),
                      DataCell(Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(assignment['timeframe']),
                      )),
                      DataCell(Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(assignment['skills']),
                      )),
                    ],
                  ))
              .toList(),
            ),
        ),
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateHarvestFieldCropAssignment()));
    }, child:const Icon(Icons.add),),
    );
  }
}