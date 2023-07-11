import 'package:flutter/material.dart';
import 'package:fms/controller/model/animal_weight_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';

class EditWeight extends StatefulWidget {
  final String id;
  final AnimalWeightModel weight;
  const EditWeight({super.key, required this.id, required this.weight});

  @override
  State<EditWeight> createState() => _EditWeightState();
}

class _EditWeightState extends State<EditWeight> {
  final animalId = TextEditingController();
  DateTime? weightdate;
  final weight = TextEditingController();
  final weighttype = TextEditingController();
  final remarks = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    animalId.text=widget.weight.animalid;
    weight.text=widget.weight.weight.toString();
    weighttype.text=widget.weight.weighttype;
    remarks.text=widget.weight.remarks;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go('/animal-weight-management');
        }, icon:const Icon(Icons.arrow_back, color: white,)),
        backgroundColor: blueGrey,
        title: const Text("Update animal  Weight"),
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
                      weightdate = picked ?? widget.weight.weightdate;
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
                            LivestockRepostory().updateAnimalWeight(
                                widget.id,
                                AnimalWeightModel(
                                    animalid: animalId.text,
                                    weightdate: weightdate,
                                    weight: double.parse(weight.text),
                                    weighttype: weighttype.text,
                                    remarks: remarks.text).toJson()).then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Weight updated successfully")))).then((value) =>context.go('/animal-weight-management'));
                          }
                        },
                        child: const Text("Update Weight")),
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
