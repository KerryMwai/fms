import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/livestock/feed-record/feed-livestock-management/feed_consumption_history.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class EditLiveStockFeedType extends StatefulWidget {
  final String id;
  final FeedModel feed;
  const EditLiveStockFeedType(
      {super.key, required this.id, required this.feed});

  @override
  State<EditLiveStockFeedType> createState() => _EditLiveStockFeedTypeState();
}

class _EditLiveStockFeedTypeState extends State<EditLiveStockFeedType> {
  final feedname = TextEditingController();
  final feedtype = TextEditingController();
  final quantityaday = TextEditingController();
  final livestockname = TextEditingController();
  final livestockid = TextEditingController();
  final animalweight = TextEditingController();
  final feedingmethod = TextEditingController();
  DateTime? date;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    feedname.text = widget.feed.feedname;
    feedtype.text = widget.feed.feedtype;
    quantityaday.text = widget.feed.quantityaday.toString();
    livestockname.text = widget.feed.livestockname;
    livestockid.text = widget.feed.livestockid;
    animalweight.text = widget.feed.animalweight.toString();
    feedingmethod.text = widget.feed.feedingmethod;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text("Edit Feed consumption History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: feedname,
                  labelText: "Feed name",
                  valitationText: "Feed name is required"),
              FeedFormField(
                  controller: feedtype,
                  labelText: "Feed type",
                  valitationText: "Feed type is required"),
              FeedFormField(
                  controller: quantityaday,
                  labelText: "Quantity",
                  valitationText: "Quantity is required"),
              FeedFormField(
                  controller: livestockname,
                  labelText: "Livstock type",
                  valitationText: "Livestock type is required"),
              FeedFormField(
                  controller: livestockid,
                  labelText: "Livstock identification number",
                  valitationText:
                      "Livestock identification number is required"),
              FeedFormField(
                  controller: animalweight,
                  labelText: "Livestock weight",
                  valitationText: "Livestock weight is required"),
              FeedFormField(
                  controller: feedingmethod,
                  labelText: "Feeding method",
                  valitationText: "Feeding method is required"),
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
                      date = picked ?? widget.feed.date;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feeding Date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (date == null) {
                      return 'Please select a feeding date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: date != null ? date.toString().split(' ')[0] : '',
                  ),
                ),
              ),
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
                            LivestockRepostory()
                                .updateFeed(
                                    widget.id,
                                    FeedModel(
                                            feedname: feedname.text,
                                            feedtype: feedtype.text,
                                            quantityaday:
                                                double.parse(quantityaday.text),
                                            livestockname: livestockname.text,
                                            livestockid: livestockid.text,
                                            animalweight:
                                                double.parse(animalweight.text),
                                            feedingmethod: feedingmethod.text,
                                            date: date!)
                                        .toJson())
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (contes) =>
                                            const FeedConsumptionHistory())))
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Feed updated succesffully"))));
                          }
                        },
                        child: const Text("Edit Feed")),
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
