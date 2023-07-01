import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/controller/model/fertilizer_entry.dart';
import 'package:fms/pages/inventories/fertilizer/add_fertilizer.dart';
import 'package:fms/pages/inventories/fertilizer/edit_fertilizer_inventory.dart';
import 'package:fms/repository/inventory_repository.dart';

// https://github.com/felangel/bloc/tree/master/packages/flutter_bloc
class FertilizerInventoryInformation extends StatefulWidget {
  const FertilizerInventoryInformation({super.key});

  @override
  State<FertilizerInventoryInformation> createState() =>
      _FertilizerInventoryInformationState();
}

class _FertilizerInventoryInformationState
    extends State<FertilizerInventoryInformation> {
  // List<FertilizerEntry> entries = [
  //   FertilizerEntry(
  //     batchNumber: '001',
  //     name: 'Fertilizer A',
  //     type: 'Type 1',
  //     quantity: 10.0,
  //     applicationRate: 'High',
  //     applicationMethod: 'Spray',
  //     plantTargeted: 'Tomatoes',
  //     seller: 'Seller X',
  //     cost: 25.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '002',
  //     name: 'Fertilizer B',
  //     type: 'Type 2',
  //     quantity: 5.0,
  //     applicationRate: 'Medium',
  //     applicationMethod: 'Drip',
  //     plantTargeted: 'Lettuce',
  //     seller: 'Seller Y',
  //     cost: 15.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '003',
  //     name: 'Fertilizer C',
  //     type: 'Type 3',
  //     quantity: 8.0,
  //     applicationRate: 'Low',
  //     applicationMethod: 'Foliar',
  //     plantTargeted: 'Strawberries',
  //     seller: 'Seller Z',
  //     cost: 20.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '004',
  //     name: 'Fertilizer D',
  //     type: 'Type 1',
  //     quantity: 12.0,
  //     applicationRate: 'Medium',
  //     applicationMethod: 'Broadcast',
  //     plantTargeted: 'Corn',
  //     seller: 'Seller X',
  //     cost: 30.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '005',
  //     name: 'Fertilizer E',
  //     type: 'Type 2',
  //     quantity: 6.0,
  //     applicationRate: 'High',
  //     applicationMethod: 'Injection',
  //     plantTargeted: 'Cabbage',
  //     seller: 'Seller Y',
  //     cost: 18.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '006',
  //     name: 'Fertilizer F',
  //     type: 'Type 3',
  //     quantity: 9.0,
  //     applicationRate: 'Low',
  //     applicationMethod: 'Drip',
  //     plantTargeted: 'Carrots',
  //     seller: 'Seller Z',
  //     cost: 22.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '007',
  //     name: 'Fertilizer G',
  //     type: 'Type 1',
  //     quantity: 7.0,
  //     applicationRate: 'Medium',
  //     applicationMethod: 'Foliar',
  //     plantTargeted: 'Peppers',
  //     seller: 'Seller X',
  //     cost: 28.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '008',
  //     name: 'Fertilizer H',
  //     type: 'Type 2',
  //     quantity: 4.0,
  //     applicationRate: 'High',
  //     applicationMethod: 'Broadcast',
  //     plantTargeted: 'Spinach',
  //     seller: 'Seller Y',
  //     cost: 12.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '009',
  //     name: 'Fertilizer I',
  //     type: 'Type 3',
  //     quantity: 11.0,
  //     applicationRate: 'Low',
  //     applicationMethod: 'Spray',
  //     plantTargeted: 'Beans',
  //     seller: 'Seller Z',
  //     cost: 26.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '010',
  //     name: 'Fertilizer J',
  //     type: 'Type 1',
  //     quantity: 3.0,
  //     applicationRate: 'Medium',
  //     applicationMethod: 'Injection',
  //     plantTargeted: 'Broccoli',
  //     seller: 'Seller X',
  //     cost: 14.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '011',
  //     name: 'Fertilizer K',
  //     type: 'Type 2',
  //     quantity: 8.0,
  //     applicationRate: 'High',
  //     applicationMethod: 'Drip',
  //     plantTargeted: 'Onions',
  //     seller: 'Seller Y',
  //     cost: 21.0,
  //   ),
  //   FertilizerEntry(
  //     batchNumber: '012',
  //     name: 'Fertilizer L',
  //     type: 'Type 3',
  //     quantity: 6.0,
  //     applicationRate: 'Low',
  //     applicationMethod: 'Foliar',
  //     plantTargeted: 'Melons',
  //     seller: 'Seller Z',
  //     cost: 16.0,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Fertilizer Inventories"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: InventoriesRepository().getFertilizerInventories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("An error occured"),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Batch Number')),
                        DataColumn(label: Text('Fertilizer name')),
                        DataColumn(label: Text('Fertilizer type')),
                        DataColumn(label: Text('Application Rate')),
                        DataColumn(label: Text('Application Method')),
                        DataColumn(label: Text('Plant Targeted')),
                        DataColumn(label: Text('Seller')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Cost')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows:
                          snapshot.data!.docs.map((DocumentSnapshot snapshot) {
                        FertilizerEntry fertilizer = FertilizerEntry.fromJson(
                            snapshot.data()! as Map<String, dynamic>);
                        return DataRow(
                          cells: [
                            DataCell(Text(fertilizer.batchNumber)),
                            DataCell(Text(fertilizer.name)),
                            DataCell(Text(fertilizer.type)),
                            DataCell(Text(fertilizer.applicationRate)),
                            DataCell(Text(fertilizer.applicationMethod)),
                            DataCell(Text(fertilizer.plantTargeted)),
                            DataCell(Text(fertilizer.seller)),
                            DataCell(Text("${fertilizer.quantity} Kgs")),
                            DataCell(Text("Ksh. ${fertilizer.cost}")),
                            DataCell(Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditFertilizerInventory(id: snapshot.id, inventory: fertilizer)));
                                    },
                                    
                                    icon: Icon(
                                      Icons.edit,
                                      color: green,)),
                                IconButton(
                                    onPressed: () {
                                      showVewDialogCard(fertilizer, context);
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: grey,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showAlertForDeletion(snapshot.id, fertilizer, context);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: red,
                                    )),
                              ],
                            )),
                          ],
                        );
                      }).toList()),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddFertilizerInventory()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showVewDialogCard(fertilizer, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${fertilizer.batchNumber}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Batch Number: ${fertilizer.batchNumber}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Fertilizer Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.name}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fertilizer Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.type}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fertilizer quantity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.quantity} Kgs",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Application rate',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.applicationRate}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Application method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.applicationMethod}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fertilizer quantity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.quantity} Kgs",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Seller',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.seller}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fertilizer cost',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${fertilizer.cost}",
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

  Future<void> showAlertForDeletion(id, fertilizer, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${fertilizer.name}"),
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
                  InventoriesRepository()
                      .deleteFertilizerInventory(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${fertilizer.name} deleted suuccessfully")))
                                  );
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
