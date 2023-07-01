import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/harvesting/create_harvest_plan.dart';

class HarvestingInformation extends StatefulWidget {
  const HarvestingInformation({super.key});

  @override
  State<HarvestingInformation> createState() => _HarvestingInformationState();
}

class _HarvestingInformationState extends State<HarvestingInformation> {
  final List<List<String>> dummyData = [
    [
      'Tomatoes',
      'Machine Harvesting',
      'Long Rainy Season',
      '10 tons',
      'Harvesting machine',
      '15 workers',
      'Warehouse'
    ],
    [
      'Apples',
      'Handpicking',
      'Cool Dry Season',
      '5 tons',
      'Pruning shears, baskets',
      '8 workers',
      'Cold storage'
    ],
    [
      'Wheat',
      'Machine Harvesting',
      'Hot Dry Season',
      '15 tons',
      'Combine harvester',
      '20 workers',
      'Grain silo'
    ],
    [
      'Corn',
      'Machine Harvesting',
      'Long Rainy Season',
      '8 tons',
      'Corn harvester',
      '12 workers',
      'Storage shed'
    ],
    [
      'Grapes',
      'Handpicking',
      'Hot Dry Season',
      '3 tons',
      'Pruning shears, baskets',
      '6 workers',
      'Cool storage'
    ],
    [
      'Oranges',
      'Machine Harvesting',
      'Hot Dry Season',
      '7 tons',
      'Citrus harvester',
      '10 workers',
      'Refrigerated truck'
    ],
    [
      'Potatoes',
      'Handpicking',
      'Cool Dry Season',
      '12 tons',
      'Digging fork, baskets',
      '18 workers',
      'Root cellar'
    ],
    [
      'Strawberries',
      'Handpicking',
      'Hot Dry Season',
      '2 tons',
      'Berry picker, containers',
      '4 workers',
      'Refrigerated van'
    ],
    [
      'Soybeans',
      'Machine Harvesting',
      'Long Rainy Season',
      '20 tons',
      'Combine harvester',
      '25 workers',
      'Grain elevator'
    ],
    [
      'Lettuce',
      'Handpicking',
      'Cool Dry Season',
      '1 ton',
      'Harvesting knife, crates',
      '3 workers',
      'Refrigerated truck'
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blueGrey,
          title: const Text("Harvesting plans"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Table(
              border: TableBorder.all(width: 1.0, color: Colors.black),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                  ),
                  children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Plant Type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Harvesting Method',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Harvesting Season (Kenyan)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Quantity Estimate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Equipment',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Labor Requirement',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Storage and Transportation',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                for (final row in dummyData)
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[0]),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[1]),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[2]),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[3]),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[4]),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[5]),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(row[6]),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateHarvestPlan()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
