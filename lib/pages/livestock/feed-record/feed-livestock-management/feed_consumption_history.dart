import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/add_livestock_feed_type.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/edit_livestock_feed_type.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/feed_consumption_history_pdf.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';

// https://fluttergems.dev/table/
class FeedConsumptionHistory extends StatefulWidget {
  const FeedConsumptionHistory({super.key});

  @override
  State<FeedConsumptionHistory> createState() => _FeedConsumptionHistoryState();
}

class _FeedConsumptionHistoryState extends State<FeedConsumptionHistory> {
  late List<FeedModel> feedhistories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Consumption History"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: LivestockRepostory().getAllFeedsSnapshot(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
            feedhistories=snapshot.data!.docs.map((DocumentSnapshot document) => FeedModel.fromJson(
                          document.data() as Map<String, dynamic>)).toList();
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(),
                    columns: const [
                      DataColumn(label: Text('Livestock ID')),
                      DataColumn(label: Text('Breed')),
                      DataColumn(label: Text('Animal Weight')),
                      DataColumn(label: Text('Feed name')),
                      DataColumn(label: Text('Feed type')),
                      DataColumn(label: Text('Quantity/day')),
                      DataColumn(label: Text('Feeding Method')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                      final history = FeedModel.fromJson(
                          document.data() as Map<String, dynamic>);
                      return DataRow(cells: [
                        DataCell(Text(history.livestockid)),
                        DataCell(Text(history.livestockname)),
                        DataCell(Text("${history.animalweight} Kgs")),
                        DataCell(Text(history.feedname)),
                        DataCell(Text(history.feedtype)),
                        DataCell(Text("${history.quantityaday} Kgs")),
                        DataCell(Text(history.feedingmethod)),
                        DataCell(Text(
                            DateFormat("dd-MMMM-yyyy").format(history.date))),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditLiveStockFeedType(
                                                id: document.id,
                                                feed: history,
                                              )));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                  size: 25,
                                )),
                            IconButton(
                                onPressed: () {
                                  showVewDialogCard(history, context);
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {
                                  showAlertForDeletion(
                                      document.id, history, context);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                )),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
          backgroundColor: green,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FeedConsumptionHistoryPdfPreviewPage(feedModel: feedhistories,)));
          },
          child: const Icon(Icons.picture_as_pdf)),
          const SizedBox(height: 10,),
          FloatingActionButton(
              backgroundColor: green,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddLiveStockFeedType()));
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }

  Future<void> showVewDialogCard(history, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${history.livestockname} -> ${history.feedname}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'History of: ${history.livestockname} -> ${history.feedname}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Animal name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${history.livestockname}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Animal weight',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${history.animalweight} Kgs",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Feed name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    history.feedname,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Feed type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${history.feedtype}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Quantity a day',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${history.quantityaday} Kgs",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Feeding method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${history.feedingmethod}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Feeding date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    DateFormat("dd-MMMM-yyyy").format(history.date),
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

  Future<void> showAlertForDeletion(id, history, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
              "Are you sure you want to delete ${history.feedname} for livestock ${history.livestockname}"),
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
                      .deleteFeed(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${history.feedname} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
