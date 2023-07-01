import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/labor_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/labor/add_labor_infor.dart';
import 'package:fms/pages/crop_managemnt/labor/edit_labor_infor.dart';
import 'package:fms/repository/labor_repository.dart';
class LaborManagementInformation extends StatefulWidget {
  const LaborManagementInformation({super.key});

  @override
  State<LaborManagementInformation> createState() => _LaborManagementInformationState();
}

class _LaborManagementInformationState extends State<LaborManagementInformation> {
  final List<Map<String, dynamic>> dummyData = [
    {
      'id': 'EMP001',
      'name': 'John Smith',
      'contact': 'john@example.com',
      'role': 'Farmhand',
      'availability': 'Full-time',
      'schedule': '8 AM - 5 PM',
      'task': 'Harvesting',
      'field': 'Field A',
      'seasonalDemand': 'High',
    },
    {
      'id': 'EMP002',
      'name': 'Jane Doe',
      'contact': 'jane@example.com',
      'role': 'Tractor Operator',
      'availability': 'Part-time',
      'schedule': '9 AM - 1 PM',
      'task': 'Tilling',
      'field': 'Field B',
      'seasonalDemand': 'Low',
    },
    // Add more dummy data here for additional rows
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Labor Management Information"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: LaborRepository().getAllLaborSnapshots(),
        builder: (context, snapshot) {
          return Container(
            margin:const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                columns: const [
                  DataColumn(label: Text('Employee ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Contact')),
                  DataColumn(label: Text('Role')),
                  DataColumn(label: Text('Availability')),
                  DataColumn(label: Text('Work Schedule')),
                  DataColumn(label: Text('Task Assignment')),
                  DataColumn(label: Text('Field Location')),
                  DataColumn(label: Text('Seasonal Demands')),
                  DataColumn(label: Text('Action')),
                ],
                rows: snapshot.data!.docs
                    .map(
                      (DocumentSnapshot documentSnapshot){
                        final data=LaborModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
                        return DataRow(
                        cells: [
                          DataCell(Text(data.employeeid)),
                          DataCell(Text(data.employeename)),
                          DataCell(Text(data.employeecontact)),
                          DataCell(Text(data.role)),
                          DataCell(Text(data.availability)),
                          DataCell(Text(data.schedule)),
                          DataCell(Text(data.task)),
                          DataCell(Text(data.field)),
                          DataCell(Text(data.seasonaldemand)),
                          DataCell(
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditLaborInformation(id: documentSnapshot.id, employee: data)));
                                }, icon: Icon(Icons.edit, color: green,)),
                                IconButton(onPressed: (){
                                  showAlertForDeletion(documentSnapshot.id, data, context);
                                }, icon: Icon(Icons.delete, color: red,))
                              ],
                            )
                          ),
                        ],
                      );
                      }
                    )
                    .toList(),
                  ),
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddLaborInformation()));
      }, child:const Icon(Icons.add),),
    );
  }






  Future<void> showAlertForDeletion(id, employee, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${employee.employeename}"),
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
                  LaborRepository()
                      .deleteLaborInfor(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content:
                                  Text("${employee.employeename} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}