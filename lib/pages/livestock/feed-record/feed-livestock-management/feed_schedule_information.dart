import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_schedule_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/add_feed_schedule.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/edit_feed_schedule.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/feeding_schedule_pdf.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';

// https://fluttergems.dev/table/
class FeedScheduleInformation extends StatefulWidget {
  const FeedScheduleInformation({super.key});

  @override
  State<FeedScheduleInformation> createState() =>
      _FeedScheduleInformationState();
}

class _FeedScheduleInformationState extends State<FeedScheduleInformation> {
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
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Feeding Schedules"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: LivestockRepostory().getAllFeedSchedulesSnapshot(),
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
            final feedschedules=snapshot.data!.docs.map((schedule) =>FeedScheduleModel.fromJson(schedule.data() as Map<String, dynamic>) ,).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:const  EdgeInsets.only(left: 20),
                  width: size.width*0.5,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(green)
                    ),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FeedSchedulePdfPreviewPage(feedschedule: feedschedules,)));
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.picture_as_pdf),
                      SizedBox(width: 6,),
                      Text("Generate Pdf")
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Livestock ID')),
                          DataColumn(label: Text('Breed')),
                          DataColumn(label: Text('Feeding interval')),
                          DataColumn(label: Text('Feed name')),
                          DataColumn(label: Text('Feed type')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Feeding method')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                          final schedule = FeedScheduleModel.fromJson(
                              document.data() as Map<String, dynamic>);
                          return DataRow(cells: [
                            DataCell(Text(schedule.livestockid)),
                            DataCell(Text(schedule.livestocktype)),
                            DataCell(Text(
                                "${DateFormat("h:mm a").format(schedule.feedingintervalfrom)} — ${DateFormat("h:mm a").format(schedule.feedingintervalto)}")),
                            DataCell(Text(schedule.feedname)),
                            DataCell(Text(schedule.feedtype)),
                            DataCell(Text("${schedule.feedquantity} Kgs")),
                            DataCell(Text(schedule.feedingmethod)),
                            DataCell(Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditFeedingSchedule(
                                                  feedschedule: schedule,
                                                  id: document.id)));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                      size: 25,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showVewDialogCard(schedule, context);
                                    },
                                    icon: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.grey,
                                      size: 30,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showAlertForDeletion(
                                          document.id, schedule, context);
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
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: green,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddFeedingSchedule()));
          },
          child: const Icon(Icons.add)),
    );
  }

  Future<void> showVewDialogCard(schedule, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${schedule.livestockid} -> ${schedule.livestocktype}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Schedule of: ${schedule.livestockid} -> ${schedule.livestocktype}',
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
                    "${schedule.livestocktype}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Feed schedule',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${DateFormat("h:mm a").format(schedule.feedingintervalfrom)} — ${DateFormat("h:mm a").format(schedule.feedingintervalto)}",
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
                    schedule.feedname,
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
                    "${schedule.feedtype}",
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
                    "${schedule.feedquantity} Kgs",
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
                    "${schedule.feedingmethod}",
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
          content: Text(
              "Are you sure you want to delete ${schedule.livestockid} for livestock ${schedule.livestocktype}"),
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
                      .deleteFeedSchedule(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${schedule.livestcokid} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
