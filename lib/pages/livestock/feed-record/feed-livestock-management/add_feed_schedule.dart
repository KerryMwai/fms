import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class FeedingSchedule extends StatefulWidget {
  const FeedingSchedule({super.key});

  @override
  State<FeedingSchedule> createState() => _FeedingScheduleState();
}

class _FeedingScheduleState extends State<FeedingSchedule> {
  final livestockid = TextEditingController();
  final livestocktype = TextEditingController();
  final feedingintervalfrom = TextEditingController();
  final feedingintervalto = TextEditingController();
  final feedname = TextEditingController();
  final feedtype = TextEditingController();
  final feedquantity = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Schedule feeding"),
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
                  controller: livestocktype,
                  labelText: "Livestock type",
                  valitationText: "Livestock type is required"),
              FeedFormField(
                  controller: feedingintervalfrom,
                  labelText: "Feeding interval from",
                  valitationText: "Feeding interval from is required"),
              FeedFormField(
                  controller: feedingintervalto,
                  labelText: "Feeding interval to",
                  valitationText: "Feeding interval to is required"),
              FeedFormField(
                  controller: feedname,
                  labelText: "Feed name",
                  valitationText: "Feed name is required"),
              FeedFormField(
                  controller: feedtype,
                  labelText: "Feed type",
                  valitationText: "Feed type is required"),
              FeedFormField(
                  controller: feedquantity,
                  labelText: "Feed quantity",
                  valitationText: "Feed quantity is required"),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text("Add Schedule")),
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
