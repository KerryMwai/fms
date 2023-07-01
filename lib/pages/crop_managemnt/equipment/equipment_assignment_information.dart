import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/equipment_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/equipment/assign_equipment.dart';
import 'package:fms/repository/inventory_repository.dart';

class EquipmentAssignmentInformation extends StatefulWidget {
  const EquipmentAssignmentInformation({super.key});

  @override
  State<EquipmentAssignmentInformation> createState() =>
      _EquipmentAssignmentInformationState();
}

class _EquipmentAssignmentInformationState
    extends State<EquipmentAssignmentInformation> {
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
        title: const Text("Equipment Assignment"),
        centerTitle: true,
        backgroundColor: blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: InventoriesRepository().getEquipmentAssignedSnapshots(),
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
                      DataColumn(label: Text('Model')),
                      DataColumn(label: Text('Maintenance Schedule')),
                      DataColumn(label: Text('Equipment assigned')),
                      DataColumn(label: Text('Field name')),
                      DataColumn(label: Text('Assign Equipment')),
                    ],
                    rows: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
                      final entry=EquipmentEntry.fromJson(documentSnapshot.data()! as Map<String, dynamic>);
                      return DataRow(
                        cells: [
                          DataCell(Text(entry.serialNumber)),
                          DataCell(Text(entry.name)),
                          DataCell(Text(entry.type)),
                          DataCell(Text(entry.description)),
                          DataCell(Text(entry.model)),
                          DataCell(Text(entry.maintenanceSchedule)),
                          DataCell(Text(entry.assigned?"Yes":"No")),
                          DataCell(Text(entry.field)),
                           DataCell(
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(blueGrey),
                                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 20))
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignEquipment(id: documentSnapshot.id, equipment: entry)));
                              }, 
                              child:  Text("Assign A Field", style: TextStyle(fontSize: 18, color: white),))
                                ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
