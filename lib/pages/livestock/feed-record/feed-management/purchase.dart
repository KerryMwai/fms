import 'package:flutter/material.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class PurchaseFeed extends StatefulWidget {
  const PurchaseFeed({super.key});

  @override
  State<PurchaseFeed> createState() => _PurchaseFeedState();
}

class _PurchaseFeedState extends State<PurchaseFeed> {
  TextEditingController farmname = TextEditingController();
  TextEditingController contactinformation = TextEditingController();
  TextEditingController deliveryaddress = TextEditingController();
  TextEditingController feedname = TextEditingController();
  TextEditingController feedtype = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController businessEmail = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Feed"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: farmname,
                  labelText: "Farm name",
                  valitationText: "Farm name is required"),
              FeedFormField(
                  controller: contactinformation,
                  labelText: "Farm email",
                  valitationText: "Farm email is required"),
              FeedFormField(
                  controller: deliveryaddress,
                  labelText: "Delivery address",
                  valitationText: "Delivery address is required"),
              FeedFormField(
                  controller: feedname,
                  labelText: "Feed name",
                  valitationText: "Feed name is required"),
              FeedFormField(
                  controller: feedtype,
                  labelText: "Feed type",
                  valitationText: "Feed type is required"),
              FeedFormField(
                  controller: quantity,
                  labelText: "Quantity",
                  valitationText: "Quantity is required"),
              FeedFormField(
                  controller: businessEmail,
                  labelText: "Saler email",
                  valitationText: "Saler email is required"),
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
                        child: const Text("Send Order")),
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
