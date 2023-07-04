import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddWeight extends StatefulWidget {
  const AddWeight({super.key});

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  final animalId = TextEditingController();
  final weightdate = TextEditingController();
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
              FeedFormField3(
                  controller: weightdate,
                  labelText: "Weight date",
                  valitationText: "Weight date is required"),
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
                          if (_formKey.currentState!.validate()) {}
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
