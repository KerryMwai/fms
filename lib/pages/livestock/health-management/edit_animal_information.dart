import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_health_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/nested-details-page.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddAnimalHealthInformation extends StatefulWidget {
  final String id;
  final AnimalHealthModel health;
  const AddAnimalHealthInformation(
      {super.key, required this.id, required this.health});

  @override
  State<AddAnimalHealthInformation> createState() =>
      _AddAnimalHealthInformationState();
}

class _AddAnimalHealthInformationState
    extends State<AddAnimalHealthInformation> {
  final livestockid = TextEditingController();
  final bodytemperature = TextEditingController();
  final heartrate = TextEditingController();
  final weight = TextEditingController();
  final respiratoryrate = TextEditingController();
  final status = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    livestockid.text = widget.health.animalid;
    bodytemperature.text = widget.health.bodytemperature.toString();
    heartrate.text = widget.health.heartrate.toString();
    weight.text = widget.health.weight.toString();
    respiratoryrate.text = widget.health.respiratoryrate.toString();
    status.text = widget.health.status;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Update Animal Health Infor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: livestockid,
                  labelText: "Livestock id",
                  valitationText: "Livestock id is required"),
              FeedFormField(
                  controller: bodytemperature,
                  labelText: "Livestock body temperature",
                  valitationText: "Livestock  body temperature is required"),
              FeedFormField(
                  controller: heartrate,
                  labelText: "Animal heart rate",
                  valitationText: "Animal heart rate is required"),
              FeedFormField(
                  controller: weight,
                  labelText: "Animal weight",
                  valitationText: "Animal weight is required"),
              FeedFormField(
                  controller: respiratoryrate,
                  labelText: "Animal respiratory rate",
                  valitationText: "Animal respiratory rate is required"),
              FeedFormField(
                  controller: status,
                  labelText: "Animal status (Sick/Health)",
                  valitationText: "Animal status is required"),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(green)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LivestockRepostory()
                                .updateAnimalHealthInformation(
                                    widget.id,
                                    AnimalHealthModel(
                                            animalid: livestockid.text,
                                            imageaddress:
                                                "https://cdn.pixabay.com/photo/2016/07/11/08/29/cow-1509258_640.jpg",
                                            bodytemperature: double.parse(
                                                bodytemperature.text),
                                            heartrate:
                                                int.parse(heartrate.text),
                                            weight: double.parse(weight.text),
                                            respiratoryrate:
                                                int.parse(respiratoryrate.text),
                                            status: status.text)
                                        .toJson())
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Information updated successfully"))))
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubDetailsPage(
                                              name: "Health Management",
                                            ))));
                          }
                        },
                        child: const Text("Update Health Infor")),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}