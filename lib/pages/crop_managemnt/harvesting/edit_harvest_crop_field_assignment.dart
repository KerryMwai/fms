import 'package:flutter/material.dart';
import 'package:fms/controller/model/harvesting_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/repository/harvesting_repostory.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';

class EditHarvestFieldCropAssignment extends StatefulWidget {
  final String id;
  final HarvestingModel harvestdata;
  const EditHarvestFieldCropAssignment({super.key, required this.id, required this.harvestdata});

  @override
  State<EditHarvestFieldCropAssignment> createState() =>
      _EditHarvestFieldCropAssignmentState();
}

class _EditHarvestFieldCropAssignmentState
    extends State<EditHarvestFieldCropAssignment> {
  final field = TextEditingController();
  final crop = TextEditingController();
  final workforce = TextEditingController();
  final workload = TextEditingController();
  // final timeframefrom=TextEditingController();
  // final timeframeto=TextEditingController();
  final skills = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? timeframefrom;
  DateTime? timeframeto;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    field.text=widget.harvestdata.field;
    crop.text=widget.harvestdata.crop;
    workforce.text=widget.harvestdata.workforce;
    workload.text=widget.harvestdata.workload;
    skills.text=widget.harvestdata.skills;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go('/workforce-machine-assignment');
        }, icon:const Icon(Icons.arrow_back, color: white,)),
        backgroundColor: blueGrey,
        title: const Text("Update Crop Field Assignment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: field,
                  labelText: "Field name",
                  valitationText: "Field name is required"),
              FeedFormField(
                  controller: crop,
                  labelText: "Type of crop ",
                  valitationText: "Crop name is required"),
              FeedFormField(
                  controller: workforce,
                  labelText: "Workforce",
                  valitationText: "Workforce is required"),
                   FeedFormField(
                  controller: workload,
                  labelText: "Workload",
                  valitationText: "Workload is required"),
              Container(
                margin:const  EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      timeframefrom = picked??widget.harvestdata.timefrom;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time Frame From',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (timeframefrom == null) {
                      return 'Please select a starting date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: timeframefrom != null
                        ? timeframefrom.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      timeframeto = picked??widget.harvestdata.timeTo;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time Frame To',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (timeframeto == null) {
                      return 'Please select a ending date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: timeframeto != null
                        ? timeframeto.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
              
              FeedFormField(
                  controller: skills,
                  labelText: "Skills",
                  valitationText: "Skills required"),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(blueGrey),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            HarvestingRepository()
                                .updateWorkforceFieldAssignment(widget.id,HarvestingModel(
                                        field: field.text,
                                        crop: crop.text,
                                        workforce: workforce.text,
                                        
                                        timefrom: timeframefrom!,
                                        timeTo: timeframeto!,
                                        skills: skills.text,
                                        workload: workload.text)
                                    .toJson())
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar( SnackBar(
                                        content:
                                            Text("Updated ${widget.harvestdata.crop} successful"))))
                                .then((value) => context.go('/workforce-machine-assignment'));
                          }
                        },
                        child: const Text("Update Crop and Field assignment")),
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
