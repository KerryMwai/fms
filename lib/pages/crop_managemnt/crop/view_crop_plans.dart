import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_plan_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop/create_crop_plan.dart';
import 'package:fms/pages/crop_managemnt/crop/edit_crop_plan.dart';
import 'package:fms/repository/crops_repository.dart';
import 'package:intl/intl.dart';

class CropPlansPage extends StatefulWidget {
  const CropPlansPage({super.key});

  @override
  CropPlansPageState createState() => CropPlansPageState();
}

class CropPlansPageState extends State<CropPlansPage> {
  List<Map<String, dynamic>> cropManagementList = [
    {
      'id': 1,
      'crop': 'Wheat',
      'planting_date': DateTime(2023, 5, 15),
      'spacing': 0.5,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer XYZ',
      },
      'pest_management_required': true,
    },
    {
      'id': 2,
      'crop': 'Corn',
      'planting_date': DateTime(2023, 6, 1),
      'spacing': 0.6,
      'fertilizer': {
        'type': 'Synthetic',
        'name': 'Synthetic Fertilizer ABC',
      },
      'pest_management_required': false,
    },
    // Add more dummy data below
    {
      'id': 3,
      'crop': 'Rice',
      'planting_date': DateTime(2023, 6, 10),
      'spacing': 0.7,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer PQR',
      },
      'pest_management_required': true,
    },
    {
      'id': 4,
      'crop': 'Tomato',
      'planting_date': DateTime(2023, 6, 5),
      'spacing': 0.4,
      'fertilizer': {
        'type': 'Synthetic',
        'name': 'Synthetic Fertilizer DEF',
      },
      'pest_management_required': true,
    },
    {
      'id': 5,
      'crop': 'Potato',
      'planting_date': DateTime(2023, 7, 1),
      'spacing': 0.6,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer LMN',
      },
      'pest_management_required': false,
    },
    {
      'id': 6,
      'crop': 'Soybean',
      'planting_date': DateTime(2023, 6, 15),
      'spacing': 0.5,
      'fertilizer': {
        'type': 'Synthetic',
        'name': 'Synthetic Fertilizer GHI',
      },
      'pest_management_required': true,
    },
    {
      'id': 7,
      'crop': 'Cabbage',
      'planting_date': DateTime(2023, 7, 10),
      'spacing': 0.4,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer UVW',
      },
      'pest_management_required': true,
    },
    {
      'id': 8,
      'crop': 'Lettuce',
      'planting_date': DateTime(2023, 6, 20),
      'spacing': 0.3,
      'fertilizer': {
        'type': 'Synthetic',
        'name': 'Synthetic Fertilizer JKL',
      },
      'pest_management_required': false,
    },
    {
      'id': 9,
      'crop': 'Carrot',
      'planting_date': DateTime(2023, 6, 8),
      'spacing': 0.4,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer XYZ',
      },
      'pest_management_required': true,
    },
    {
      'id': 10,
      'crop': 'Apple',
      'planting_date': DateTime(2023, 8, 1),
      'spacing': 0.8,
      'fertilizer': {
        'type': 'Synthetic',
        'name': 'Synthetic Fertilizer ABC',
      },
      'pest_management_required': false,
    },
    {
      'id': 11,
      'crop': 'Orange',
      'planting_date': DateTime(2023, 7, 5),
      'spacing': 0.9,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer PQR',
      },
      'pest_management_required': true,
    },
    {
      'id': 12,
      'crop': 'Banana',
      'planting_date': DateTime(2023, 8, 10),
      'spacing': 0.7,
      'fertilizer': {
        'type': 'Synthetic',
        'name': 'Synthetic Fertilizer DEF',
      },
      'pest_management_required': true,
    },
    {
      'id': 13,
      'crop': 'Grapes',
      'planting_date': DateTime(2023, 7, 15),
      'spacing': 0.6,
      'fertilizer': {
        'type': 'Organic',
        'name': 'Organic Fertilizer LMN',
      },
      'pest_management_required': false,
    },
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text('Crop Plans'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: CropRepostory().getCropPlanSnapshots(),
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
                  "An error occurred",
                  style: TextStyle(color: red, fontSize: 18),
                ),
              );
            }
            return ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Crop')),
                        DataColumn(label: Text('Planting Date')),
                        DataColumn(label: Text('Spacing (m)')),
                        DataColumn(label: Text('Fertilizer Type')),
                        DataColumn(label: Text('Pest Management')),
                      ],
                      rows: snapshot.data!.docs
                          .map((DocumentSnapshot documentSnapshot) {
                        final plan = CropPlan.fromJson(
                            documentSnapshot.data()! as Map<String, dynamic>);
                        return DataRow(
                          cells: [
                            DataCell(Text("${plan.crop}")),
                            DataCell(Text(DateFormat('dd-MM-yy')
                                .format(plan.plantingDate!))),
                            DataCell(Text(plan.spacing.toString())),
                            DataCell(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(plan.fertilizertype!),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Text(
                                        'Name: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(plan.fertilizername!),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            DataCell(Row(
                              children: [
                                Text(
                                    plan.pestManagementRequired ? 'Yes' : 'No'),
                                const SizedBox(
                                  width: 100,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditCropPlan(
                                                    id: documentSnapshot.id,
                                                    plan: plan,
                                                  )));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showVewDialogCard(plan, context);
                                    },
                                    icon: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 30,
                                      color: Colors.blueGrey,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showAlertForDeletion(
                                          documentSnapshot.id, plan, context);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            )),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CropPlanningPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showVewDialogCard(plan, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${plan.crop}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop: ${plan.crop}',
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
                    "${plan.crop}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Planting date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('dd-MM-yy').format(plan.plantingDate!),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Plant spacing',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.spacing}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fertilizer name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.fertilizername}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fertilizer type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.fertilizertype}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Purchase date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    plan.pestManagementRequired ? "Yes" : "No",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
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

  Future<void> showAlertForDeletion(id, plan, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${plan.crop}"),
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
                  CropRepostory()
                      .deleteCropPlan(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content:
                                  Text("${plan.crop} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
