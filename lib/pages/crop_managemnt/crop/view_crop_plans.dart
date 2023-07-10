import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_plan_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop/create_crop_plan.dart';
import 'package:fms/pages/crop_managemnt/crop/crop_plans_pdf.dart';
import 'package:fms/pages/crop_managemnt/crop/edit_crop_plan.dart';
import 'package:fms/repository/crops_repository.dart';
import 'package:intl/intl.dart';

class CropPlansPage extends StatefulWidget {
  const CropPlansPage({super.key});

  @override
  CropPlansPageState createState() => CropPlansPageState();
}

class CropPlansPageState extends State<CropPlansPage> {


  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
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
            final plans=snapshot.data!.docs.map((plan)=>CropPlan.fromJson(plan.data() as Map<String, dynamic>)).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: w*0.45,
                  child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(green)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CropPlansPdfPreviewPage(cropplans: plans,)));
                      }, child:const Row(
                        children: [
                          Icon(Icons.picture_as_pdf),
                          SizedBox(width: 6,),
                          Text("Generate PDF")
                      ],)),
                 ),
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
