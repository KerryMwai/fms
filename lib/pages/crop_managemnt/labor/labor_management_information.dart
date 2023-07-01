import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/labor/add_labor_infor.dart';
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
      body: Container(
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
            ],
            rows: dummyData
                .map(
                  (data) => DataRow(
                    cells: [
                      DataCell(Text(data['id'])),
                      DataCell(Text(data['name'])),
                      DataCell(Text(data['contact'])),
                      DataCell(Text(data['role'])),
                      DataCell(Text(data['availability'])),
                      DataCell(Text(data['schedule'])),
                      DataCell(Text(data['task'])),
                      DataCell(Text(data['field'])),
                      DataCell(Text(data['seasonalDemand'])),
                    ],
                  ),
                )
                .toList(),
              ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddLaborInformation()));
      }, child:const Icon(Icons.add),),
    );
  }
}