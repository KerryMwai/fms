import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/harvesting_schedule.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/create_harvesting_schedule.dart';
import 'package:fms/pages/crop_managemnt/harvesting/edit_harvesting_schedule.dart';
import 'package:fms/repository/harvesting_repostory.dart';

class HarvestingScheduleInformation extends StatelessWidget {
  const HarvestingScheduleInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text('Harvesting Scehdules'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: HarvestingRepository().getAllharvestingSchedulesSnapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: green,),);
          }
          if(snapshot.hasError){
            return Center(child: Text("An error occured", style: TextStyle(color: red),),);
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 10.0,
                  border: TableBorder.all(),
                  headingRowColor:const  MaterialStatePropertyAll(Colors.grey),
                  columns: const [
                    DataColumn(label: Text('Crop Name')),
                    DataColumn(label: Text('Crop Maturity')),
                    DataColumn(label: Text('Crop Variety')),
                    DataColumn(label: Text('Harvesting Factors')),
                    DataColumn(label: Text('Labor & Equipment Availability')),
                    DataColumn(label: Text('Crop Storage')),
                    DataColumn(label: Text('Harvesting Plan Adjustment')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                    final schedule=HarvestingSchedule.fromJson(document.data()! as Map<String,dynamic>);
                    return  DataRow(cells: [
                      DataCell(Text(schedule.crop)),
                      DataCell(Text('${schedule.maturitydays} days')),
                      DataCell(Text(schedule.variety)),
                      DataCell(Text(schedule.harvestinfactors)),
                      DataCell(Text(schedule.laborandequipmentavailability)),
                      DataCell(Text(schedule.storage)),
                      DataCell(Text(schedule.planadjustment)),
                      DataCell(Row(children: [
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditHarvestSchedule(id: document.id, schedule: schedule,)));
                        }, icon: Icon(Icons.edit, color: green,)),
                        IconButton(onPressed: (){
                          showVewDialogCard(schedule, context);
                        }, icon: Icon(Icons.remove_red_eye_outlined, color: grey,)),
                        IconButton(onPressed: (){
                          showAlertForDeletion(document.id, schedule, context);
                        }, icon: Icon(Icons.delete, color: red,)),
                      ],)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateHarvestSchedule()));
      }, child:const Icon(Icons.add),),
    );
  }

    Future<void> showVewDialogCard(schedule, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${schedule.crop}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop: ${schedule.crop}',
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
                    "${schedule.crop}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Crop Variety',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                   schedule.variety,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Crop Maturity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${schedule.maturitydays} Days",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Harvesting factors',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    schedule.harvestinfactors,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Labor & Equipment Availability',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    schedule.laborandequipmentavailability,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Crop storage',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    schedule.storage,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                 ListTile(
                  title: Text(
                    'Plan Adjustment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    schedule.planadjustment,
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

  Future<void> showAlertForDeletion(id, schedule, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${schedule.crop}"),
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
                      .deleteHarvestingSchedule(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${schedule.crop} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}