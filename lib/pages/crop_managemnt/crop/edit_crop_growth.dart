import 'package:flutter/material.dart';
import 'package:fms/controller/model/crop_growth_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/repository/crops_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';
class EditCropTracking extends StatefulWidget {
  const EditCropTracking({super.key, required this.id, required this.data});
  final String id;
  final Map<String, dynamic> data;

  @override
  EditCropTrackingState createState() => EditCropTrackingState();
}

class EditCropTrackingState extends State<EditCropTracking> {
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
    moisturelievel.text=widget.data['soil-moisture'].toString();
    sunlight.text=widget.data['environmental-data']['sunlight']; 
    rainfall.text=widget.data['environmental-data']['rainfall'].toString();
    humidity.text=widget.data['environmental-data']['humidity'].toString();
    temperature.text=widget.data['environmental-data']['temperature'].toString();
    leafarea.text=widget.data['measurement']['leaf-area'].toString();
    plantheight.text=widget.data['measurement']['plant-height'].toString();
    phenologicalindicator.text=widget.data['phenologicalindicator'];
    cropname.text=widget.data['crop'];
    plantingdate=widget.data['plantingdate'].toDate();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go('/crop-growth-records');
        }, icon:const Icon(Icons.arrow_back, color: white,)),
        backgroundColor: blueGrey,
        title:  Text("Update Crop Growth For ${widget.data['crop']}"),
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
                      plantingdate = picked ?? plantingdate;
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
                          .updateCropGrowthInfor(widget.id,CropGrowthModel(
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
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text("Record updated successfully"))))
                          .then((value) =>context.go('/crop-growth-records'));
                    }
                  },
                  child: const Text('Update Plant Growth Infor'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
