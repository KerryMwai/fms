import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/harvest_plan_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/create_harvest_plan.dart';
import 'package:fms/pages/crop_managemnt/harvesting/edit_harvest_pla.dart';
import 'package:fms/repository/harvesting_repostory.dart';
import 'package:intl/intl.dart';

class HarvestingInformation extends StatefulWidget {
  const HarvestingInformation({super.key});

  @override
  State<HarvestingInformation> createState() => _HarvestingInformationState();
}

class _HarvestingInformationState extends State<HarvestingInformation> {
  final List<List<String>> dummyData = [
    [
      'Tomatoes',
      'Machine Harvesting',
      'Long Rainy Season',
      '10 tons',
      'Harvesting machine',
      '15 workers',
      'Warehouse'
    ],
    [
      'Apples',
      'Handpicking',
      'Cool Dry Season',
      '5 tons',
      'Pruning shears, baskets',
      '8 workers',
      'Cold storage'
    ],
    [
      'Wheat',
      'Machine Harvesting',
      'Hot Dry Season',
      '15 tons',
      'Combine harvester',
      '20 workers',
      'Grain silo'
    ],
    [
      'Corn',
      'Machine Harvesting',
      'Long Rainy Season',
      '8 tons',
      'Corn harvester',
      '12 workers',
      'Storage shed'
    ],
    [
      'Grapes',
      'Handpicking',
      'Hot Dry Season',
      '3 tons',
      'Pruning shears, baskets',
      '6 workers',
      'Cool storage'
    ],
    [
      'Oranges',
      'Machine Harvesting',
      'Hot Dry Season',
      '7 tons',
      'Citrus harvester',
      '10 workers',
      'Refrigerated truck'
    ],
    [
      'Potatoes',
      'Handpicking',
      'Cool Dry Season',
      '12 tons',
      'Digging fork, baskets',
      '18 workers',
      'Root cellar'
    ],
    [
      'Strawberries',
      'Handpicking',
      'Hot Dry Season',
      '2 tons',
      'Berry picker, containers',
      '4 workers',
      'Refrigerated van'
    ],
    [
      'Soybeans',
      'Machine Harvesting',
      'Long Rainy Season',
      '20 tons',
      'Combine harvester',
      '25 workers',
      'Grain elevator'
    ],
    [
      'Lettuce',
      'Handpicking',
      'Cool Dry Season',
      '1 ton',
      'Harvesting knife, crates',
      '3 workers',
      'Refrigerated truck'
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueGrey,
          title: const Text("Harvesting plans"),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: HarvestingRepository().getAllharvestingplansSnapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: green),);
            }
            if(snapshot.hasError){
              return Center(child: Text('An error occured', style: TextStyle(color: red),),);
            }
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                      ),
                      children: const [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Plant Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Harvesting Method',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Harvesting Season (Kenyan)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                          TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Estimated harvesting date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Quantity Estimate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Equipment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Labor Requirement',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Storage and Transportation',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                           TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Action',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...snapshot.data!.docs.map((DocumentSnapshot document){
                      final plan=HarvestPlan.fromJson(document.data() as Map<String, dynamic>);
                        return  TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(plan.crop),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(plan.method),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(plan.season),
                            ),
                          ),
                            TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(DateFormat.MMMM().format(plan.harvestingdate!)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${plan.quantity} Kgs"),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(plan.equipment),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${plan.labor} ${plan.method}"),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(plan.storage),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder:(context)=>EditHarvestPlan(id: document.id, plan: plan) ));
                                    }, icon: Icon(Icons.edit, color: green,)),
                                    IconButton(onPressed: (){
                                      showVewDialogCard(plan, context);
                                    }, icon:const Icon(Icons.remove_red_eye_outlined)),
                                    IconButton(onPressed: (){
                                        showAlertForDeletion(document.id, plan, context);
                                    }, icon: Icon(Icons.delete, color: red,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList()
                     
                  ],
                ),
              ),
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: green,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateHarvestPlan()));
          },
          child: const Icon(Icons.add),
        ));
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
                    'Harvesting month',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.MMMM().format(plan.harvestingdate!),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Harvesting method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.method}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Harvesting season',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.season}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Quantity Estimated',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.quantity} Kgs",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Equipments used',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    plan.equipment,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                 ListTile(
                  title: Text(
                    'Labor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${plan.labor} ${plan.method}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                 ListTile(
                  title: Text(
                    'Storage',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    plan.storage,
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
                  HarvestingRepository()
                      .deleteHarvestingPlan(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${plan.crop} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
