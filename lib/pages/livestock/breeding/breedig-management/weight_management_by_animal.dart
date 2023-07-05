import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_weight_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/add_animal_weight.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/edit_animal_weight.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';

class AnimalWeightManagementByParticularAnimal extends StatefulWidget {
  final String animalid;
  const AnimalWeightManagementByParticularAnimal({super.key, required this.animalid});

  @override
  State<AnimalWeightManagementByParticularAnimal> createState() => _AnimalWeightManagementByParticularAnimalState();
}

class _AnimalWeightManagementByParticularAnimalState extends State<AnimalWeightManagementByParticularAnimal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title:  Text("Animal Weight information for ${widget.animalid}"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: LivestockRepostory().getAllAnimalWeightSnapshotsForParticularAnimal(widget.animalid),
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