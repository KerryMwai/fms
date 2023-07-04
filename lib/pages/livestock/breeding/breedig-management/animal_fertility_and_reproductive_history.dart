import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_fertility_and_reproductive_history_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/add_breed.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/edit_breed.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:intl/intl.dart';

class AnimalReproductivityAndHistory extends StatefulWidget {
  const AnimalReproductivityAndHistory({super.key});

  @override
  State<AnimalReproductivityAndHistory> createState() =>
      _AnimalReproductivityAndHistoryState();
}

class _AnimalReproductivityAndHistoryState
    extends State<AnimalReproductivityAndHistory> {
  final List<Map<String, String>> dummyData = [
    {
      'Animal ID': '1',
      'Birth/Acquisition Date': '01/01/2020',
      'Breeding Attempts': '3',
      'Breeding Success': '2',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '04/01/2020',
      'Gestation Period': '62 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '66.7% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Active and playful',
      'Breeding Program': 'Program A',
      'Mating Schedule': 'Twice a year',
    },
    {
      'Animal ID': '2',
      'Birth/Acquisition Date': '03/15/2021',
      'Breeding Attempts': '2',
      'Breeding Success': '2',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '06/01/2021',
      'Gestation Period': '60 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Healthy and active',
      'Breeding Program': 'Program B',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '3',
      'Birth/Acquisition Date': '09/20/2019',
      'Breeding Attempts': '4',
      'Breeding Success': '3',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '01/01/2020',
      'Gestation Period': '57 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '75% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Good appetite',
      'Breeding Program': 'Program C',
      'Mating Schedule': 'Once every two years',
    },
    {
      'Animal ID': '4',
      'Birth/Acquisition Date': '06/12/2020',
      'Breeding Attempts': '2',
      'Breeding Success': '2',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '08/27/2020',
      'Gestation Period': '61 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Active and healthy',
      'Breeding Program': 'Program D',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '5',
      'Birth/Acquisition Date': '04/25/2022',
      'Breeding Attempts': '1',
      'Breeding Success': '1',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '07/05/2022',
      'Gestation Period': '59 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Growing rapidly',
      'Breeding Program': 'Program A',
      'Mating Schedule': 'Twice a year',
    },
    {
      'Animal ID': '6',
      'Birth/Acquisition Date': '10/05/2019',
      'Breeding Attempts': '2',
      'Breeding Success': '2',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '12/20/2019',
      'Gestation Period': '63 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Active and healthy',
      'Breeding Program': 'Program B',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '7',
      'Birth/Acquisition Date': '08/10/2021',
      'Breeding Attempts': '1',
      'Breeding Success': '0',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': 'N/A',
      'Gestation Period': 'N/A',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '0% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Reserved and calm',
      'Breeding Program': 'Program C',
      'Mating Schedule': 'Once every two years',
    },
    {
      'Animal ID': '8',
      'Birth/Acquisition Date': '02/15/2020',
      'Breeding Attempts': '3',
      'Breeding Success': '2',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '05/01/2020',
      'Gestation Period': '61 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '66.7% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Energetic and curious',
      'Breeding Program': 'Program D',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '9',
      'Birth/Acquisition Date': '11/08/2020',
      'Breeding Attempts': '2',
      'Breeding Success': '1',
      'Reproductive Cycles': 'Irregular',
      'Heat/Estrus Behavior': 'Limited',
      'Conception Dates': '02/01/2021',
      'Gestation Period': '63 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '50% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Friendly and sociable',
      'Breeding Program': 'Program A',
      'Mating Schedule': 'Twice a year',
    },
    {
      'Animal ID': '10',
      'Birth/Acquisition Date': '08/30/2019',
      'Breeding Attempts': '2',
      'Breeding Success': '1',
      'Reproductive Cycles': 'Irregular',
      'Heat/Estrus Behavior': 'Limited',
      'Conception Dates': '11/10/2019',
      'Gestation Period': '62 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '50% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Shy and reserved',
      'Breeding Program': 'Program B',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '11',
      'Birth/Acquisition Date': '07/05/2020',
      'Breeding Attempts': '2',
      'Breeding Success': '1',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '09/20/2020',
      'Gestation Period': '60 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '50% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Active and energetic',
      'Breeding Program': 'Program C',
      'Mating Schedule': 'Once every two years',
    },
    {
      'Animal ID': '12',
      'Birth/Acquisition Date': '04/02/2021',
      'Breeding Attempts': '1',
      'Breeding Success': '1',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '06/15/2021',
      'Gestation Period': '59 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Lively and active',
      'Breeding Program': 'Program D',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '13',
      'Birth/Acquisition Date': '11/01/2021',
      'Breeding Attempts': '2',
      'Breeding Success': '2',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '01/20/2022',
      'Gestation Period': '62 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Playful and friendly',
      'Breeding Program': 'Program A',
      'Mating Schedule': 'Twice a year',
    },
    {
      'Animal ID': '14',
      'Birth/Acquisition Date': '09/10/2020',
      'Breeding Attempts': '3',
      'Breeding Success': '3',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '12/01/2020',
      'Gestation Period': '63 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Active and healthy',
      'Breeding Program': 'Program B',
      'Mating Schedule': 'Once a year',
    },
    {
      'Animal ID': '15',
      'Birth/Acquisition Date': '02/12/2022',
      'Breeding Attempts': '1',
      'Breeding Success': '1',
      'Reproductive Cycles': 'Regular',
      'Heat/Estrus Behavior': 'Normal',
      'Conception Dates': '04/01/2022',
      'Gestation Period': '60 days',
      'Reproductive Health': 'No issues',
      'Breeding Performance': '100% success rate',
      'Reproductive Interventions': 'None',
      'Observations': 'Active and playful',
      'Breeding Program': 'Program C',
      'Mating Schedule': 'Once every two years',
    },
    // Add more rows here...
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Animal Productivity History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: LivestockRepostory().getAllBreedingInformationsSnapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(
                  "An error occured",
                  style: TextStyle(color: red),
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Animal ID')),
                        DataColumn(label: Text('Animal Breed')),
                        DataColumn(label: Text('Birth/Acquisition Date')),
                        DataColumn(label: Text('Breeding Attempts')),
                        DataColumn(label: Text('Breeding Success')),
                        DataColumn(label: Text('Reproductive Cycles')),
                        DataColumn(label: Text('Heat/Estrus Behavior')),
                        DataColumn(label: Text('Conception Dates')),
                        DataColumn(label: Text('Gestation Period')),
                        DataColumn(label: Text('Reproductive Health')),
                        DataColumn(label: Text('Breeding Performance')),
                        DataColumn(label: Text('Reproductive Interventions')),
                        DataColumn(label: Text('Observations')),
                        DataColumn(label: Text('Breeding Program')),
                        DataColumn(label: Text('Mating Schedule')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        final data =
                            FertilityAndReproductiveHistoryModel.fromJson(
                                document.data() as Map<String, dynamic>);
                        return DataRow(cells: [
                          DataCell(Text(data.animalid)),
                          DataCell(Text(data.animalbreed)),
                          DataCell(Text(DateFormat("dd-MMMM-yyyy")
                              .format(data.birthdate))),
                          DataCell(Text("${data.breedingattempt}")),
                          DataCell(Text("${data.breedingsuccess}")),
                          DataCell(Text(data.reproductivecycle)),
                          DataCell(Text(data.estrusbehaviour)),
                          DataCell(Text(DateFormat("dd-MMMM-yyyy")
                              .format(data.conceptiondate))),
                          DataCell(Text("${data.gestationperiod} Days")),
                          DataCell(Text(data.reproductivehealth)),
                          DataCell(Text("${data.breedingperformance} %")),
                          DataCell(Text(data.reproductiveinterventions)),
                          DataCell(Text(data.observations)),
                          DataCell(Text(data.breedingprogram)),
                          DataCell(Text(data.matingschedule)),
                          DataCell(Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditBreed(
                                                  id: document.id,
                                                  breed: data,
                                                )));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showVewDialogCard(data, context);
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: grey,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showAlertForDeletion(
                                        document.id, data, context);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: red,
                                  )),
                            ],
                          )),
                        ]);
                      }).toList(),
                    )),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddBreed()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showVewDialogCard(data, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${data.animalid}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Livestock breed: ${data.animalbreed}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Breed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${data.animalbreed}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Acquisition date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    DateFormat("dd-MMMM-yyyy").format(data.birthdate),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Breeding attempts',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${data.breedingattempt}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Breeding Success',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${data.breedingsuccess}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Reproductive cycle',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.reproductivecycle,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Estrus Behaviour',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.estrusbehaviour,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Conception date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    DateFormat("dd-MMMM-yyyy").format(data.conceptiondate),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Gestation period',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${data.gestationperiod} Days",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Reproductive health',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.reproductivehealth,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Breeding performance',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    "${data.breedingperformance} %",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Reproductive intervention',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.reproductiveinterventions,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Observations',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.observations,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Bredding program',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.breedingprogram,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Mating schedule',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    data.matingschedule,
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

  Future<void> showAlertForDeletion(id, breed, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete ${breed.animalid}"),
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
                      .deleteBreedingInformation(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "${breed.animalid} deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
