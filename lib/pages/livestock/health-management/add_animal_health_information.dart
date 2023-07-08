import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_health_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/nested-details-page.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddAnimalHealthInformation extends StatefulWidget {
  const AddAnimalHealthInformation({super.key});

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
// Image selection from the device gallery and submitting the data
  PlatformFile? imagePicked;
  UploadTask? uploadTask;
  String url = '';
  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      imagePicked = result?.files.first;
    });
  }

  Future uploadImage() async {
    final path = 'livestocks/${imagePicked!.name}';
    final file = File(imagePicked!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    url = await snapshot.ref.getDownloadURL();
    uploadTask = null;
  }

  buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 20,
          );
        }
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Animal Health Infor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imagePicked == null
                        ? const Center(child: Text("Please pick a file"))
                        : Container(
                          // width: 100,
                          height: 100,
                        color: blue[100],
                        child: Center(
                          // child: Text(pickedFile!.name),
                          child: Image.file(
                            File(imagePicked!.path!),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              selectImage();
                            },
                            child: const Text(
                              "Select File",
                              style: TextStyle(color: white, fontSize: 18),
                            )),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              uploadImage();
                            },
                            child: const Text(
                              "Upload File",
                              style: TextStyle(color: white, fontSize: 18),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildProgress()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                                .addAnimalHealthInformation(AnimalHealthModel(
                                        animalid: livestockid.text,
                                        imageaddress:
                                            "https://cdn.pixabay.com/photo/2016/07/11/08/29/cow-1509258_640.jpg",
                                        bodytemperature:
                                            double.parse(bodytemperature.text),
                                        heartrate: int.parse(heartrate.text),
                                        weight: double.parse(weight.text),
                                        respiratoryrate:
                                            int.parse(respiratoryrate.text),
                                        status: status.text)
                                    .toJson())
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Information added successfully"))))
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubDetailsPage(
                                              name: "Health Management",
                                            ))));
                          }
                        },
                        child: const Text("Add Health Infor")),
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
