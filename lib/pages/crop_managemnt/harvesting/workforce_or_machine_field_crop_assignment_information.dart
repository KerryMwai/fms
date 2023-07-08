import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/harvesting_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/add_harvest_crop_field_assignment.dart';
import 'package:fms/pages/crop_managemnt/harvesting/edit_harvest_crop_field_assignment.dart';
import 'package:fms/repository/harvesting_repostory.dart';
import 'package:intl/intl.dart';

class WorkforceMachineFieldCropAssignmentInformation extends StatefulWidget {
  const WorkforceMachineFieldCropAssignmentInformation({super.key});

  @override
  State<WorkforceMachineFieldCropAssignmentInformation> createState() =>
      _WorkforceMachineFieldCropAssignmentInformationState();
}

class _WorkforceMachineFieldCropAssignmentInformationState
    extends State<WorkforceMachineFieldCropAssignmentInformation> {
  List<Map<String, dynamic>> generateDummyData() {
    List<String> fields = [
      'Field 1',
      'Field 2',
      'Field 3',
      'Field 4',
      'Field 5'
    ];
    List<String> crops = ['Corn', 'Wheat', 'Soybean', 'Rice', 'Potato'];
    List<String> workforceMachines = [
      'Workers',
      'Machines',
      'Workers',
      'Machines',
      'Workers'
    ];
    List<String> workloadTasks = [
      'Planting, Harvesting',
      'Plowing, Irrigation, Harvesting',
      'Weeding, Fertilization',
      'Watering, Pesticide spraying',
      'Harvesting, Sorting'
    ];
    List<String> timeframes = [
      'March - July',
      'October - June',
      'April - September',
      'May - October',
      'June - November'
    ];
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
      body: StreamBuilder<QuerySnapshot>(
          stream:
              HarvestingRepository().getAllWorkforceFieldAssignmentSnapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "An error occured",
                  style: TextStyle(color: red),
                ),
              );
            }
            return SingleChildScrollView(
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
                    DataColumn(
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Action',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                  rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                    final assignment = HarvestingModel.fromJson(
                        document.data() as Map<String, dynamic>);
                    return DataRow(
                      cells: [
                        DataCell(Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(assignment.crop),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(assignment.workforce),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(assignment.workload),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(DateFormat.MMMM()
                                  .format(assignment.timefrom)),
                              const Text(
                                " - ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(DateFormat.MMMM().format(assignment.timeTo)),
                            ],
                          ),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(assignment.skills),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditHarvestFieldCropAssignment(
                                                  harvestdata: assignment,
                                                  id: document.id,
                                                )));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showVewDialogCard(assignment, context);
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: grey,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showAlertForDeletion(
                                        document.id, assignment, context);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: red,
                                  )),
                            ],
                          ),
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CreateHarvestFieldCropAssignment()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showAlertForDeletion(id, assignment, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${assignment.crop}"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No")),
            const SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: () {
                  HarvestingRepository()
                      .deleteWorkforceFieldAssignment(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${assignment.crop} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }

  Future<void> showVewDialogCard(assignment, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${assignment.crop}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop: ${assignment.crop}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Crop Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${assignment.crop}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Field name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    assignment.field,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Workforce',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    assignment.workforce,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Workload',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    assignment.workload,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Skills to be used',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    assignment.skills,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Timeframe in this field ${assignment.field}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(DateFormat.MMMM().format(assignment.timefrom)),
                      const Text(
                        " - ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(DateFormat.MMMM().format(assignment.timeTo)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok")),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }
}
