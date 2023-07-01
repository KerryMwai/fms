import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class PurchaseEquipment extends StatefulWidget {
  const PurchaseEquipment({super.key});

  @override
  State<PurchaseEquipment> createState() => _PurchaseEquipmentState();
}

class _PurchaseEquipmentState extends State<PurchaseEquipment> {
  final youremail=TextEditingController();
  final selleremail=TextEditingController();
  final serialnumber = TextEditingController();
  final name = TextEditingController();
  final type = TextEditingController();
  final description = TextEditingController();
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final yearOfManufacture = TextEditingController();
  final price = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Purchase an equipment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
               FeedFormField3(
                  controller: youremail,
                  labelText: "Your email",
                  valitationText: "Your email is required"),
              FeedFormField3(
                  controller: selleremail,
                  labelText: "Seller email",
                  valitationText: "Seller email is required"),
              FeedFormField(
                  controller: serialnumber,
                  labelText: "Equipment serial number",
                  valitationText: "Equipment serial number is required"),
              FeedFormField(
                  controller: name,
                  labelText: "Equipment name",
                  valitationText: "Equipment is required"),
              FeedFormField(
                  controller: type,
                  labelText: "Equipment type",
                  valitationText: "Equipment type is required"),
              FeedFormField(
                  controller: description,
                  labelText: "Equipment description",
                  valitationText: "Equipment description is required"),
              FeedFormField(
                  controller: manufacturer,
                  labelText: "Equipment manufacturer",
                  valitationText: "Equipment manufacturer is required"),
              FeedFormField(
                  controller: model,
                  labelText: "Equipment model",
                  valitationText: "Equipment model is required"),
              FeedFormField3(
                  controller: yearOfManufacture,
                  labelText: "Year of manufacture",
                  valitationText: "Year of manufacture is required"),
              FeedFormField(
                  controller: price,
                  labelText: "Price",
                  valitationText: "Price is required"),
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
