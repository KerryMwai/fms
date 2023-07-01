import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/harvesting_schedule.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/create_harvesting_schedule.dart';
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
                    ]);
                  }).toList(),
                ),
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateHarvestSchedule()));
      }, child:const Icon(Icons.add),),
    );
  }
}