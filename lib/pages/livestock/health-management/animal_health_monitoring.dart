import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_health_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/health-management/edit_animal_information.dart';
import 'package:fms/repository/livestock_repository.dart';

class IndividualAnimalHealth extends StatefulWidget {
  final String id;
  final String animalId;
  final String imagename;
  final String imageaddress;
  final double bodyTemperature;
  final int heartRate;
  final double weight;
  final int respiratoryRate;
  final String status;

  const IndividualAnimalHealth(
      {super.key,
      required this.animalId,
      required this.imageaddress,
      required this.bodyTemperature,
      required this.heartRate,
      required this.weight,
      required this.respiratoryRate,
      required this.status,
      required this.id,
      required this.imagename});

  @override
  State<IndividualAnimalHealth> createState() => _IndividualAnimalHealthState();
}

class _IndividualAnimalHealthState extends State<IndividualAnimalHealth> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.imageaddress),
        ),
        title: Text(
          'Animal ID: ${widget.animalId}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            EasyRichText(
              'Body Temperature: ${widget.bodyTemperature}  o C',
              patternList: [
                EasyRichTextPattern(
                    targetString: "o",
                    superScript: true,
                    style:  TextStyle(fontSize: 18, color: black)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Heart Rate: ${widget.heartRate} BPM',
              style: TextStyle(fontSize: 16, color: black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Weight: ${widget.weight} Kgs',
              style: TextStyle(fontSize: 16, color: black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Respiratory Rate: ${widget.respiratoryRate} rpm',
              style: TextStyle(fontSize: 16, color: black),
            ),
            Row(
              children: [
                const Text(
                  'Health status:  ',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.status,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
        trailing: SizedBox(
          width: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditAnimalHealthInformation(
                                    id: widget.id,
                                    health: AnimalHealthModel(
                                        animalid: widget.animalId,
                                        imagename: widget.imagename,
                                        imageaddress: widget.imageaddress,
                                        bodytemperature: widget.bodyTemperature,
                                        heartrate: widget.heartRate,
                                        weight: widget.weight,
                                        respiratoryrate: widget.respiratoryRate,
                                        status: widget.status),
                                  )));
                    },
                    splashColor: Colors.green[200],
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () async {
                      showAlertForDeletion(widget.id, widget.animalId,
                          widget.imagename, context);
                    },
                    splashColor: Colors.red[100],
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showAlertForDeletion(id, animalid, imagename, context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete animal $animalid}"),
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
                      .deleteAnimalHealthInformation(id)
                      .then((value) => Navigator.pop(context))
                      .then((value) => FirebaseStorage.instance
                          .ref()
                          .child("livestocks/${widget.imagename}")
                          .delete())
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content:
                                  Text("$animalid deleted suuccessfully"))));
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
