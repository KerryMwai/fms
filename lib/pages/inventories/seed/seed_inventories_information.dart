import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/inventories/seed/add_seed_inventory.dart';
import 'package:fms/pages/inventories/seed/edit_seed_inventory.dart';
import 'package:fms/repository/inventory_repository.dart';

class SeedInventoryInformation extends StatefulWidget {
  const SeedInventoryInformation({super.key});

  @override
  State<SeedInventoryInformation> createState() =>
      _SeedInventoryInformationState();
}

class _SeedInventoryInformationState extends State<SeedInventoryInformation> {
  List<Map<String, dynamic>> seedInventory = [
    {
      'batchNumber': '001',
      'variety': 'Tomato',
      'source': 'ABC Seeds',
      'quantity': 100,
      'purchaseQuantity': 100,
      'totalAmountPaid': 500,
      'acquisitionDate': '2023-06-25',
      'planted': 80,
      'remaining': 40,
      'storage': 'Cool and dry',
    },
    {
      'batchNumber': '002',
      'variety': 'Carrot',
      'source': 'XYZ Seeds',
      'quantity': 150,
      'purchaseQuantity': 150,
      'totalAmountPaid': 250,
      'acquisitionDate': '2023-06-26',
      'planted': 120,
      'remaining': 30,
      'storage': 'Dry and dark',
    },
    {
      'batchNumber': '003',
      'variety': 'Lettuce',
      'source': 'DEF Seeds',
      'quantity': 80,
      'purchaseQuantity': 80,
      'totalAmountPaid': 200,
      'acquisitionDate': '2023-06-27',
      'planted': 60,
      'remaining': 20,
      'storage': 'Refrigerated',
    },
    {
      'batchNumber': '004',
      'variety': 'Cucumber',
      'source': 'GHI Seeds',
      'quantity': 120,
      'purchaseQuantity': 120,
      'totalAmountPaid': 300,
      'acquisitionDate': '2023-06-28',
      'planted': 100,
      'remaining': 20,
      'storage': 'Cool and dry',
    },
    {
      'batchNumber': '005',
      'variety': 'Pepper',
      'source': 'JKL Seeds',
      'quantity': 90,
      'purchaseQuantity': 90,
      'totalAmountPaid': 450,
      'acquisitionDate': '2023-06-29',
      'planted': 70,
      'remaining': 20,
      'storage': 'Dry and dark',
    },
    {
      'batchNumber': '006',
      'variety': 'Spinach',
      'source': 'MNO Seeds',
      'quantity': 60,
      'purchaseQuantity': 60,
      'totalAmountPaid': 150,
      'acquisitionDate': '2023-06-30',
      'planted': 40,
      'remaining': 20,
      'storage': 'Refrigerated',
    },
    {
      'batchNumber': '007',
      'variety': 'Corn',
      'source': 'PQR Seeds',
      'quantity': 150,
      'purchaseQuantity': 150,
      'totalAmountPaid': 500,
      'acquisitionDate': '2023-07-01',
      'planted': 120,
      'remaining': 30,
      'storage': 'Cool and dry',
    },
    {
      'batchNumber': '008',
      'variety': 'Eggplant',
      'source': 'STU Seeds',
      'quantity': 90,
      'purchaseQuantity': 90,
      'totalAmountPaid': 400,
      'acquisitionDate': '2023-07-02',
      'planted': 70,
      'remaining': 20,
      'storage': 'Dry and dark',
    },
    {
      'batchNumber': '009',
      'variety': 'Radish',
      'source': 'VWX Seeds',
      'quantity': 100,
      'purchaseQuantity': 100,
      'totalAmountPaid': 250,
      'acquisitionDate': '2023-07-03',
      'planted': 80,
      'remaining': 20,
      'storage': 'Refrigerated',
    },
    {
      'batchNumber': '010',
      'variety': 'Zucchini',
      'source': 'YZA Seeds',
      'quantity': 70,
      'purchaseQuantity': 70,
      'totalAmountPaid': 300,
      'acquisitionDate': '2023-07-04',
      'planted': 50,
      'remaining': 20,
      'storage': 'Cool and dry',
    },
    {
      'batchNumber': '011',
      'variety': 'Broccoli',
      'source': 'BCD Seeds',
      'quantity': 110,
      'purchaseQuantity': 110,
      'totalAmountPaid': 350,
      'acquisitionDate': '2023-07-05',
      'planted': 90,
      'remaining': 20,
      'storage': 'Dry and dark',
    },
    {
      'batchNumber': '012',
      'variety': 'Cabbage',
      'source': 'EFG Seeds',
      'quantity': 80,
      'purchaseQuantity': 80,
      'totalAmountPaid': 200,
      'acquisitionDate': '2023-07-06',
      'planted': 60,
      'remaining': 20,
      'storage': 'Refrigerated',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Seed Inventories"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: InventoriesRepository().getSeedInventories(),
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
                  "There was an enror encountered",
                  style: TextStyle(fontSize: 18, color: red),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStatePropertyAll(grey),
                    columns: const [
                      DataColumn(label: Text('Seed Batch')),
                      DataColumn(label: Text('Seed Variety')),
                      DataColumn(label: Text('Quantity in Store')),
                      DataColumn(label: Text('Planted')),
                      DataColumn(label: Text('Date planted')),
                      DataColumn(label: Text('Storage')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: snapshot.data!.docs
                        .map((DocumentSnapshot seedInventory) {
                      Map<String, dynamic> seed =
                          seedInventory.data()! as Map<String, dynamic>;

                      return DataRow(cells: [
                        DataCell(Text(seed['batchNumber'])),
                        DataCell(Text(seed['variety'])),
                        DataCell(Text("${seed['quantity']} Kgs")),
                        DataCell(Text("${seed['usage']['planted']} Kgs")),
                        DataCell(Text(seed['acquisitionDate'])),
                        DataCell(Text(seed['storage'])),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditSeedInventory(
                                                id: seedInventory.id,
                                                seedInventoryToUpdate: seed,
                                              )));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  showVewDialogCard(seed, context);
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Are you sure you want to delete ${seed['variety']}"),
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
                                                    .deleteSeedInventory(
                                                        seedInventory.id)
                                                    .then((value) =>
                                                        Navigator.pop(context))
                                                    .then((value) => ScaffoldMessenger
                                                            .of(context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "${seed['variety']} deleted suuccessfully"))));
                                              },
                                              child: const Text("Yes"))
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddSeedInventory()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  

  Future<void> showVewDialogCard(seed, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${seed['variety']}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Batch Number: ${seed['batchNumber']}',
                  style:const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Variety',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    seed['variety'],
                    style:const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Quantity in store',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${seed['quantity']} Kgs",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                   ListTile(
                        title: Text(
                          'Planted',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        subtitle: Text(
                          "${seed['usage']['planted']} Kgs",
                          style:const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                ListTile(
                  title: Text(
                    'Acquisition Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    seed['acquisitionDate'],
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
                    seed['storage'],
                    style:const TextStyle(
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
}
