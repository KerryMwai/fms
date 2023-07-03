import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddFeedingSchedule extends StatefulWidget {
  const AddFeedingSchedule({super.key});

  @override
  State<AddFeedingSchedule> createState() => _AddFeedingScheduleState();
}

class _AddFeedingScheduleState extends State<AddFeedingSchedule> {
  final livestockid = TextEditingController();
  final livestocktype = TextEditingController();
  TimeOfDay? feedingintervalfrom;
  TimeOfDay? feedingintervalto;
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      feedingintervalfrom = picked ?? TimeOfDay.now();
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feeding from',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (feedingintervalfrom == null) {
                      return 'Please select time from';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: feedingintervalfrom != null
                        ? feedingintervalfrom.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      feedingintervalto = picked ?? TimeOfDay.now();
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feeding to',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (feedingintervalto == null) {
                      return 'Please select time to ';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: feedingintervalto != null
                        ? feedingintervalto.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
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
