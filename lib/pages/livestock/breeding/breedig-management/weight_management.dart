import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_weight_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/add_animal_weight.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/edit_animal_weight.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';

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
      body: StreamBuilder<QuerySnapshot>(
        stream: LivestockRepostory().getAllAnimalWeightSnapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center( child: CircularProgressIndicator(color: green,),);
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center( child: Text("An error occured", style: TextStyle(color: green, fontSize: 18),),);
          }
          return SingleChildScrollView(
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
            DataColumn(label: Text('Action')),
          ],
          rows: snapshot.data!.docs
              .map(
                (DocumentSnapshot document){
                  final weight=AnimalWeightModel.fromJson(document.data() as Map<String, dynamic>);
                  return DataRow(
                  cells:[
                    DataCell(Text(weight.animalid)),
                    DataCell(Text(DateFormat.yMMMMEEEEd().format(weight.weightdate!))),
                    DataCell(Text("${weight.weight} Kgs")),
                    DataCell(Text(weight.weighttype)),
                    DataCell(Text(weight.remarks)),
                    DataCell(Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>EditWeight(id: document.id, weight: weight,)));
                        }, icon: Icon(Icons.edit, color: green,)),
                         
                          IconButton(onPressed: (){
                            showAlertForDeletion(document.id, weight, context);
                          }, icon: Icon(Icons.delete, color: red,)),
                      ],
                    ))
                  ]
                );  
                }
              )
              .toList(),
          )
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddWeight()));
      },child:const Icon(Icons.add),),
    );
  }


    Future<void> showAlertForDeletion(id, weight, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${weight.animalid}"),
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
                  LivestockRepostory()
                      .deleteAnimalWeight(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content:
                                  Text("${weight.animalid} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}