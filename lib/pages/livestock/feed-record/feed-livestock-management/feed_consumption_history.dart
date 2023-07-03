import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/edit_livestock_feed_type.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';

// https://fluttergems.dev/table/
class FeedConsumptionHistory extends StatefulWidget {
  const FeedConsumptionHistory({super.key});

  @override
  State<FeedConsumptionHistory> createState() => _FeedConsumptionHistoryState();
}

class _FeedConsumptionHistoryState extends State<FeedConsumptionHistory> {
  List<Map<String, dynamic>> consumptionhistoryData = [
    {
      'id': 1,
      'Livestock ID': 'Cow-001',
      'Breed': 'Holstein',
      'Weight': 550,
      'Feed type': 'Hay (Alfalfa)',
      'Quantity/day': 5,
      'Feeding Method': 'Individual trough',
      'Date': '2023-06-01',
    },
    {
      'id': 2,
      'Livestock ID': 'Pig-023',
      'Breed': 'Duroc',
      'Weight': 120,
      'Feed type': 'Commercial Feed (Pig Starter)',
      'Quantity/day': 1.5,
      'Feeding Method': 'Automated feeder',
      'Date': '2023-06-02',
    },
    {
      'id': 3,
      'Livestock ID': 'Chicken-105',
      'Breed': 'Rhode Island Red',
      'Weight': 2,
      'Feed type': 'Corn',
      'Quantity/day': 0.25,
      'Feeding Method': 'Group feeding',
      'Date': '2023-06-03',
    },
    {
      'id': 4,
      'Livestock ID': 'Goat-008',
      'Breed': 'Boer',
      'Weight': 40,
      'Feed type': 'Pellets (Goat Feed)',
      'Quantity/day': 1.2,
      'Feeding Method': 'Individual feeding unit',
      'Date': '2023-06-04',
    },
    {
      'id': 5,
      'Livestock ID': 'Cow-015',
      'Breed': 'Angus',
      'Weight': 600,
      'Feed type': 'Silage (Maize)',
      'Quantity/day': 10,
      'Feeding Method': 'Group feeding',
      'Date': '2023-06-05',
    },
    {
      'id': 6,
      'Livestock ID': 'Sheep-007',
      'Breed': 'Suffolk',
      'Weight': 80,
      'Feed type': 'Hay (Timothy)',
      'Quantity/day': 2.5,
      'Feeding Method': 'Individual trough',
      'Date': '2023-06-06',
    },
    {
      'id': 8,
      'Livestock ID': 'Turkey-042',
      'Breed': 'Broad-Breasted Bronze',
      'Weight': 10,
      'Feed type': 'Poultry Feed',
      'Quantity/day': 0.5,
      'Feeding Method': 'Group feeding',
      'Date': '2023-06-07',
    },
    {
      'id': 9,
      'Livestock ID': 'Pig-056',
      'Breed': 'Hampshire',
      'Weight': 150,
      'Feed type': 'Commercial Feed (Pig Grower)',
      'Quantity/day': 2,
      'Feeding Method': 'Automated feeder',
      'Date': '2023-06-08',
    },
    {
      'id': 10,
      'Livestock ID': 'Goat-019',
      'Breed': 'Nubian',
      'Weight': 35,
      'Feed type': 'Hay (Mixed)',
      'Quantity/day': 1,
      'Feeding Method': 'Group feeding',
      'Date': '2023-06-09',
    },
    {
      'Livestock ID': 'Chicken-203',
      'Breed': 'Leghorn',
      'Weight': 1.5,
      'Feed type': 'Layer Feed',
      'Quantity/day': 0.2,
      'Feeding Method': 'Group feeding',
      'Date': '2023-06-10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          title: const Text("Consumption History"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(children: [
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: LivestockRepostory().getAllFeedsSnapshot(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: green,
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "An error occured!",
                              style: TextStyle(color: red),
                            ),
                          );
                        }
                        return DataTable(
                          columns: const [
                            DataColumn(label: Text('Livestock ID')),
                            DataColumn(label: Text('Breed')),
                            DataColumn(label: Text('Weight')),
                            DataColumn(label: Text('Feed type')),
                            DataColumn(label: Text('Quantity/day')),
                            DataColumn(label: Text('Feeding Method')),
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Action')),
                          ],
                          rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                            final history=FeedModel.fromJson(document.data() as Map<String, dynamic>);
                            return DataRow(cells: [
                              DataCell(Text(history.livestockid)),
                              DataCell(Text(history.livestockname)),
                              DataCell(Text("${history.animalweight} Kgs")),
                              DataCell(Text(history.feedtype)),
                              DataCell(Text("${history.quantityaday}")),
                              DataCell(Text(history.feedingmethod)),
                              DataCell(Text(DateFormat("dd-MMMM-yyyy").format(history.date))),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditLiveStockFeedType(id: document.id,feed: history,)));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                        size: 25,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 25,
                                      )),
                                ],
                              )),
                            ]);
                          }).toList(),
                        );
                      })),
            ),
          ]),
        ));
  }
}
