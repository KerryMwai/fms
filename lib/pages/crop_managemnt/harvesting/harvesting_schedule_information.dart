import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/create_harvesting_schedule.dart';

class HarvestingScheduleInformation extends StatelessWidget {
  const HarvestingScheduleInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text('Harvesting Scehdules'),
      ),
      body: SingleChildScrollView(
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
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Corn')),
                  DataCell(Text('90 days')),
                  DataCell(Text('Hybrid')),
                  DataCell(Text('Weather, pest control')),
                  DataCell(Text('Sufficient')),
                  DataCell(Text('Silos')),
                  DataCell(Text('No adjustments needed')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Wheat')),
                  DataCell(Text('120 days')),
                  DataCell(Text('Winter Wheat')),
                  DataCell(Text('Weather, maturity')),
                  DataCell(Text('Limited')),
                  DataCell(Text('Grain bins')),
                  DataCell(Text('Adjust harvest time')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Rice')),
                  DataCell(Text('150 days')),
                  DataCell(Text('Long Grain')),
                  DataCell(Text('Water availability, pest control')),
                  DataCell(Text('Sufficient')),
                  DataCell(Text('Warehouses')),
                  DataCell(Text('Implement drying process')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Soybeans')),
                  DataCell(Text('100 days')),
                  DataCell(Text('GMO-free')),
                  DataCell(Text('Weather, disease control')),
                  DataCell(Text('Limited')),
                  DataCell(Text('Silos')),
                  DataCell(Text('No adjustments needed')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Potatoes')),
                  DataCell(Text('90 days')),
                  DataCell(Text('Russet')),
                  DataCell(Text('Maturity, disease control')),
                  DataCell(Text('Sufficient')),
                  DataCell(Text('Cold storage')),
                  DataCell(Text('Adjust storage temperature')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Cotton')),
                  DataCell(Text('150 days')),
                  DataCell(Text('Pima')),
                  DataCell(Text('Weather, pest control')),
                  DataCell(Text('Limited')),
                  DataCell(Text('Warehouses')),
                  DataCell(Text('Implement ginning process')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Barley')),
                  DataCell(Text('110 days')),
                  DataCell(Text('Malting Barley')),
                  DataCell(Text('Weather, maturity')),
                  DataCell(Text('Sufficient')),
                  DataCell(Text('Grain bins')),
                  DataCell(Text('No adjustments needed')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Tomatoes')),
                  DataCell(Text('70 days')),
                  DataCell(Text('Cherry Tomatoes')),
                  DataCell(Text('Maturity, disease control')),
                  DataCell(Text('Limited')),
                  DataCell(Text('Canning facilities')),
                  DataCell(Text('Adjust harvest time')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Peppers')),
                  DataCell(Text('80 days')),
                  DataCell(Text('Bell Peppers')),
                  DataCell(Text('Maturity, pest control')),
                  DataCell(Text('Sufficient')),
                  DataCell(Text('Freezers')),
                  DataCell(Text('No adjustments needed')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Apples')),
                  DataCell(Text('120 days')),
                  DataCell(Text('Golden Delicious')),
                  DataCell(Text('Maturity, disease control')),
                  DataCell(Text('Limited')),
                  DataCell(Text('Cold storage')),
                  DataCell(Text('Implement controlled atmosphere')),
                ]),
                 DataRow(cells: [
                  DataCell(Text('Avocado')),
                  DataCell(Text('160 days')),
                  DataCell(Text('Large black')),
                  DataCell(Text('Maturity, Pest')),
                  DataCell(Text('Unlimited')),
                  DataCell(Text('Cold storage')),
                  DataCell(Text('Implement controlled atmosphere')),
                ]),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateHarvestSchedule()));
      }, child:const Icon(Icons.add),),
    );
  }
}