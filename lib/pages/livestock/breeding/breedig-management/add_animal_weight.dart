import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_weight_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/breeding/breedig-management/weight_management.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddWeight extends StatefulWidget {
  const AddWeight({super.key});

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  final animalId = TextEditingController();
  DateTime? weightdate;
  final weight = TextEditingController();
  final weighttype = TextEditingController();
  final remarks = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Add animal  Weight"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField2(
                  controller: animalId,
                  labelText: "Animal id",
                  valitationText: "Animal id is required"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      weightdate = picked ?? DateTime.now();
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight measurement date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (weightdate == null) {
                      return 'Please select weight measurement date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: weightdate != null
                        ? weightdate.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
              FeedFormField2(
                  controller: weight,
                  labelText: "Weight (Kg)",
                  valitationText: "Weight is required"),
              FeedFormField(
                  controller: weighttype,
                  labelText: "Weight type",
                  valitationText: "Weight type is required"),
              FeedFormField(
                  controller: remarks,
                  labelText: "Weight remarks",
                  valitationText: "Weight remarks is required"),
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
                            LivestockRepostory().addAnimalWeight(
                                AnimalWeightModel(
                                    animalid: animalId.text,
                                    weightdate: weightdate,
                                    weight: double.parse(weight.text),
                                    weighttype: weighttype.text,
                                    remarks: remarks.text).toJson()).then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Weight added successfully")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>const AnimalWeightManagement())));
                          }
                        },
                        child: const Text("Add Weight")),
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
