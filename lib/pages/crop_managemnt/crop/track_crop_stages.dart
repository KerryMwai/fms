import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_growth_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/crop/records_growth_stages.dart';
import 'package:fms/repository/crops_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class CropTracking extends StatefulWidget {
  const CropTracking({super.key});

  @override
  CropTrackingState createState() => CropTrackingState();
}

class CropTrackingState extends State<CropTracking> {
  final moisturelievel = TextEditingController();
  final sunlight = TextEditingController();
  final rainfall = TextEditingController();
  final humidity = TextEditingController();
  final temperature = TextEditingController();
  final leafarea = TextEditingController();
  final plantheight = TextEditingController();
  final phenologicalindicator = TextEditingController();
  final cropname = TextEditingController();
  DateTime? plantingdate;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text('Crop Growth Tracking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const Text(
                  "Crop Information",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.3,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 20,
                ),
                FeedFormField(
                    controller: cropname,
                    labelText: "Crop name",
                    valitationText: "Crop name is required"),
                const SizedBox(height: 20.0),
                TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      plantingdate = picked!;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Planting Date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (plantingdate == null) {
                      return 'Please select a planting date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: plantingdate != null
                        ? plantingdate.toString().split(' ')[0]
                        : '',
                  ),
                ),
                const SizedBox(height: 20.0),
                FeedFormField(
                    controller: phenologicalindicator,
                    labelText: "Phenological indicator",
                    valitationText: "Phenological indicator"),
                const SizedBox(height: 20.0),
                FeedFormField2(
                    controller: plantheight,
                    labelText: "Plant height",
                    valitationText: "Plant height is required"),
                const SizedBox(height: 20.0),
                FeedFormField2(
                    controller: leafarea,
                    labelText: "Leaf Area",
                    valitationText: "Leaf Area is required"),
                const SizedBox(height: 20.0),
                const Text(
                  "Environmental data",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.3,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 10,
                ),
                FeedFormField2(
                    controller: temperature,
                    labelText: "Temperature",
                    valitationText: "Temperature is required"),
                const SizedBox(
                  height: 10,
                ),
                FeedFormField2(
                    controller: humidity,
                    labelText: "Humidity",
                    valitationText: "Humidity is required"),
                const SizedBox(
                  height: 10,
                ),
                FeedFormField2(
                    controller: rainfall,
                    labelText: "Rainfall",
                    valitationText: "Rainfall is required"),
                const SizedBox(
                  height: 10,
                ),
                FeedFormField(
                    controller: sunlight,
                    labelText: "Sunlight",
                    valitationText: "Sunlight is required"),
                const SizedBox(height: 16.0),
                FeedFormField2(
                    controller: moisturelievel,
                    labelText: "Soil Moisture Level",
                    valitationText: "Soil Moisture Level is required"),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(blueGrey),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 60, vertical: 15))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CropRepostory()
                          .addCropGrowthInfor(CropGrowthModel(
                                  crop: cropname.text,
                                  plantingdate: plantingdate!,
                                  phenologicalindicator:
                                      phenologicalindicator.text,
                                  plantheight: double.parse(plantheight.text),
                                  leafarea: double.parse(leafarea.text),
                                  tempereture: double.parse(temperature.text),
                                  humidity: double.parse(humidity.text),
                                  rainfall: double.parse(rainfall.text),
                                  sunlight: sunlight.text,
                                  soilMoistureLevel:
                                      double.parse(moisturelievel.text))
                              .toJson())
                          .then((value) {
                            cropname.clear();
                            phenologicalindicator.clear();
                            plantheight.clear();
                            leafarea.clear();
                            temperature.clear();
                            humidity.clear();
                            rainfall.clear();
                            sunlight.clear();
                            moisturelievel.clear();
                          })
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text("Record added successfully"))))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CropGrowthRecords())));
                    }
                  },
                  child: const Text('Record Infor'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
