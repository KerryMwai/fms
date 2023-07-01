import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/equipment_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/inventories/equipment/add_equipment_inventory.dart';
import 'package:fms/pages/inventories/equipment/edit_equipment.dart';
import 'package:fms/repository/inventory_repository.dart';

class EquipmentInventoryInformation extends StatefulWidget {
  const EquipmentInventoryInformation({super.key});

  @override
  State<EquipmentInventoryInformation> createState() =>
      _EquipmentInventoryInformationState();
}

class _EquipmentInventoryInformationState
    extends State<EquipmentInventoryInformation> {
  // List<EquipmentEntry> entries = [
  //   EquipmentEntry(
  //     serialNumber: '123456',
  //     name: 'Tractor',
  //     type: 'Heavy Machinery',
  //     description: 'Farm tractor with multiple attachments',
  //     manufacturer: 'ABC Manufacturing',
  //     model: 'XYZ-2000',
  //     yearOfManufacture: '2021',
  //     purchasePrice: 25000.0,
  //     purchaseDate: '2022-01-15',
  //     maintenanceSchedule: 'Every 100 hours of operation',
  //   ),
  //   EquipmentEntry(
  //     serialNumber: '789012',
  //     name: 'Harvester',
  //     type: 'Heavy Machinery',
  //     description: 'Combine harvester for grain crops',
  //     manufacturer: 'DEF Manufacturing',
  //     model: 'HarvestMaster 5000',
  //     yearOfManufacture: '2020',
  //     purchasePrice: 50000.0,
  //     purchaseDate: '2022-03-22',
  //     maintenanceSchedule: 'Every harvest season',
  //   ),
  //   // Add more entries here...
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Equipment inventory"),
        centerTitle: true,
        backgroundColor: blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: InventoriesRepository().getEquipmentSnapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            }
            if (snapshot.hasError) {
              return const Text("An error occured");
            }
            
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Serial Number')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Manufacturer')),
                      DataColumn(label: Text('Model')),
                      DataColumn(label: Text('Year of Manufacture')),
                      DataColumn(label: Text('Purchase Price')),
                      DataColumn(label: Text('Purchase Date')),
                      DataColumn(label: Text('Maintenance Schedule')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
                      final entry=EquipmentEntry.fromJson(documentSnapshot.data()! as Map<String, dynamic>);
                      return DataRow(
                        cells: [
                          DataCell(Text(entry.serialNumber)),
                          DataCell(Text(entry.name)),
                          DataCell(Text(entry.type)),
                          DataCell(Text(entry.description)),
                          DataCell(Text(entry.manufacturer)),
                          DataCell(Text(entry.model)),
                          DataCell(Text(entry.yearOfManufacture)),
                          DataCell(Text("Ksh. ${entry.purchasePrice}")),
                          DataCell(Text(entry.purchaseDate)),
                          DataCell(Text(entry.maintenanceSchedule)),
                           DataCell(Row(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditEquipmentInventoryInformation(id: documentSnapshot.id,equipment: entry,)));
                              }, icon: Icon(Icons.edit, color: green,)),
                              IconButton(onPressed: (){
                                showVewDialogCard(entry, context);
                              }, icon: Icon(Icons.remove_red_eye_outlined, color: grey,)),
                              IconButton(onPressed: (){
                                showAlertForDeletion(documentSnapshot.id, entry, context);
                              }, icon: Icon(Icons.delete, color: red,)),
                            ],
                           )),
                        ],
                      );
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
                  builder: (context) => const AddEquipmentInventoryInformation()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

    Future<void> showVewDialogCard(entry, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${entry.serialNumber}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Serial Number: ${entry.serialNumber}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Equipment Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${entry.name}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Equipment Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${entry.type}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Equipment description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${entry.description}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Equipment year manufactured',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${entry.yearOfManufacture}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Equipment price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "Ksh. ${entry.purchasePrice}",
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
                    "${entry.purchaseDate}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Maintenance schedule',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${entry.maintenanceSchedule}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
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

  Future<void> showAlertForDeletion(id, entry, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${entry.name}"),
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
                      .deleteEquipment(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${entry.name} deleted suuccessfully")))
                                  );
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
