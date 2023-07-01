import 'package:flutter/material.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class FeedUsage extends StatefulWidget {
  const FeedUsage({super.key});

  @override
  State<FeedUsage> createState() => _FeedUsageState();
}

class _FeedUsageState extends State<FeedUsage> {
  TextEditingController date = TextEditingController();
  TextEditingController livestockid= TextEditingController();
  TextEditingController feedname= TextEditingController();
  TextEditingController feedQuantity = TextEditingController();
  TextEditingController feedCost = TextEditingController();
  TextEditingController feedschedule = TextEditingController();
  TextEditingController notes = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usage of the day"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: date,
                  labelText: "Date of use",
                  valitationText: "Date is required"),
              FeedFormField(
                  controller: livestockid,
                  labelText: "Livestock number",
                  valitationText: "Livestock number is required"),
              FeedFormField(
                  controller: feedname,
                  labelText: "Feed name",
                  valitationText: "Feed name is required"),
              FeedFormField(
                  controller: feedQuantity,
                  labelText: "Feed quantity",
                  valitationText: "Feed quantity is required"),
              FeedFormField(
                  controller: feedCost,
                  labelText: "Feed cost",
                  valitationText: "Feed cost is required"),
              FeedFormField(
                  controller: feedschedule,
                  labelText: "Feed schedule",
                  valitationText: "Feed schedule is required"),
              FeedFormField(
                  controller: notes,
                  labelText: "Feed notes",
                  valitationText: "Feed notes is required"),
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
                        child: const Text("Save Usage")),
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
