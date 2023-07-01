import 'package:flutter/material.dart';
import 'package:fms/controller/model/labor_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/labor/labor_management_information.dart';
import 'package:fms/repository/labor_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class EditLaborInformation extends StatefulWidget {
  final String id;
  final LaborModel employee;
  const EditLaborInformation(
      {super.key, required this.id, required this.employee});

  @override
  State<EditLaborInformation> createState() => _EditLaborInformationState();
}

class _EditLaborInformationState extends State<EditLaborInformation> {
  final employeeId = TextEditingController();
  final employeename = TextEditingController();
  final employeecontact = TextEditingController();
  final role = TextEditingController();
  final availability = TextEditingController();
  final schedule = TextEditingController();
  final task = TextEditingController();
  final field = TextEditingController();
  final seasonalDemand = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    employeeId.text = widget.employee.employeeid;
    employeename.text = widget.employee.employeename;
    employeecontact.text = widget.employee.employeecontact;
    role.text = widget.employee.role;
    availability.text = widget.employee.availability;
    schedule.text = widget.employee.schedule;
    task.text = widget.employee.task;
    field.text = widget.employee.field;
    seasonalDemand.text = widget.employee.seasonaldemand;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Edit labor information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: employeeId,
                  labelText: "Employee idefication number",
                  valitationText: "Employee idefication number is required"),
              FeedFormField(
                  controller: employeename,
                  labelText: "Employee name ",
                  valitationText: "Employee name is required"),
              FeedFormField(
                  controller: employeecontact,
                  labelText: "Employee contact",
                  valitationText: "Employee contact is required"),
              FeedFormField(
                  controller: role,
                  labelText: "Employee role ",
                  valitationText: "Employee role is required"),
              FeedFormField(
                  controller: availability,
                  labelText: "Employee availability",
                  valitationText: "Employee availability is required"),
              FeedFormField(
                  controller: schedule,
                  labelText: "Employee schedule",
                  valitationText: "Employee schedule is required"),
              FeedFormField(
                  controller: task,
                  labelText: "Employee task ",
                  valitationText: "Employee taskis required"),
              FeedFormField(
                  controller: field,
                  labelText: "Field name ",
                  valitationText: "Field name is required"),
              FeedFormField(
                  controller: seasonalDemand,
                  labelText: "Seasonal demand",
                  valitationText: "Seasonal demand is required"),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(blueGrey),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LaborRepository()
                                .updateLaborInfor(widget.id, LaborModel(
                                        employeeid: employeeId.text,
                                        employeename: employeename.text,
                                        employeecontact: employeecontact.text,
                                        role: role.text,
                                        availability: availability.text,
                                        schedule: schedule.text,
                                        task: task.text,
                                        field: field.text,
                                        seasonaldemand: seasonalDemand.text)
                                    .toJson())
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Labor infor updated successfully"))))
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ontetxt) =>
                                            const LaborManagementInformation())));
                          }
                        },
                        child: const Text("Update labor infor")),
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
