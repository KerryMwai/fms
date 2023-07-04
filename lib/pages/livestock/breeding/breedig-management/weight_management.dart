import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/add_animal_weight.dart';

class AnimalWeightManagement extends StatefulWidget {
  const AnimalWeightManagement({super.key});

  @override
  State<AnimalWeightManagement> createState() => _AnimalWeightManagementState();
}

class _AnimalWeightManagementState extends State<AnimalWeightManagement> {
    final List<Map<String, String>> dummyData = [
    {
      'Animal ID': '1',
      'Weight Date': '01/01/2022',
      'Weight (kg)': '100',
      'Weight Type': 'Measured',
      'Remarks': 'Healthy weight',
    },
    {
      'Animal ID': '2',
      'Weight Date': '03/15/2022',
      'Weight (kg)': '80',
      'Weight Type': 'Measured',
      'Remarks': 'Slight weight loss',
    },
    {
      'Animal ID': '3',
      'Weight Date': '05/20/2022',
      'Weight (kg)': '90',
      'Weight Type': 'Measured',
      'Remarks': 'Steady weight',
    },
    {
      'Animal ID': '4',
      'Weight Date': '08/01/2022',
      'Weight (kg)': '110',
      'Weight Type': 'Measured',
      'Remarks': 'Weight gain',
    },
    {
      'Animal ID': '5',
      'Weight Date': '10/15/2022',
      'Weight (kg)': '95',
      'Weight Type': 'Measured',
      'Remarks': 'Maintaining weight',
    },
    {
      'Animal ID': '6',
      'Weight Date': '01/10/2023',
      'Weight (kg)': '105',
      'Weight Type': 'Measured',
      'Remarks': 'Healthy weight',
    },
    {
      'Animal ID': '7',
      'Weight Date': '03/20/2023',
      'Weight (kg)': '85',
      'Weight Type': 'Measured',
      'Remarks': 'Slight weight loss',
    },
    {
      'Animal ID': '8',
      'Weight Date': '06/01/2023',
      'Weight (kg)': '95',
      'Weight Type': 'Measured',
      'Remarks': 'Steady weight',
    },
    {
      'Animal ID': '9',
      'Weight Date': '09/15/2023',
      'Weight (kg)': '105',
      'Weight Type': 'Measured',
      'Remarks': 'Weight gain',
    },
    {
      'Animal ID': '10',
      'Weight Date': '12/01/2023',
      'Weight (kg)': '100',
      'Weight Type': 'Measured',
      'Remarks': 'Maintaining weight',
    },
    {
      'Animal ID': '11',
      'Weight Date': '01/01/2022',
      'Weight (kg)': '80',
      'Weight Type': 'Estimated',
      'Remarks': 'Estimated weight',
    },
    {
      'Animal ID': '12',
      'Weight Date': '03/15/2022',
      'Weight (kg)': '70',
      'Weight Type': 'Estimated',
      'Remarks': 'Estimated weight',
    },
    {
      'Animal ID': '13',
      'Weight Date': '05/20/2022',
      'Weight (kg)': '85',
      'Weight Type': 'Estimated',
      'Remarks': 'Estimated weight',
    },
    {
      'Animal ID': '14',
      'Weight Date': '08/01/2022',
      'Weight (kg)': '95',
      'Weight Type': 'Estimated',
      'Remarks': 'Estimated weight',
    },
    {
      'Animal ID': '15',
      'Weight Date': '10/15/2022',
      'Weight (kg)': '90',
      'Weight Type': 'Estimated',
      'Remarks': 'Estimated weight',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Animal Weight information"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
      columns: const [
        DataColumn(label: Text('Animal ID')),
        DataColumn(label: Text('Weight Date')),
        DataColumn(label: Text('Weight (kg)')),
        DataColumn(label: Text('Weight Type')),
        DataColumn(label: Text('Remarks')),
      ],
      rows: dummyData
          .map(
            (data) => DataRow(
              cells: data.entries
                  .map((entry) => DataCell(Text(entry.value)))
                  .toList(),
            ),
          )
          .toList(),
    )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddWeight()));
      },child:const Icon(Icons.add),),
    );
  }
}