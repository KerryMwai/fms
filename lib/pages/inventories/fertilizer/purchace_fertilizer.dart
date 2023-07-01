import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class PurchaseFertilizer extends StatefulWidget {
  const PurchaseFertilizer({super.key});

  @override
  State<PurchaseFertilizer> createState() => _PurchaseFertilizerState();
}

class _PurchaseFertilizerState extends State<PurchaseFertilizer> {
  final youremail=TextEditingController();
  final selleremail=TextEditingController();
  final batchnumber = TextEditingController();
  final name = TextEditingController();
  final type = TextEditingController();
  final applicationrate = TextEditingController();
  final applicationmethod = TextEditingController();
  final quantity = TextEditingController();
  final costperunit = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Purchase Fertilizer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
                  FeedFormField(
                  controller: youremail,
                  labelText: "Your email",
                  valitationText: "Your email is required"),
                  FeedFormField(
                  controller: selleremail,
                  labelText: "Seller email",
                  valitationText: "Seller email is required"),
              FeedFormField(
                  controller: batchnumber,
                  labelText: "Fertilizer batch number",
                  valitationText: "Fertilizer batch number is required"),
              FeedFormField(
                  controller: name,
                  labelText: "Fertilizer name",
                  valitationText: "Seed variety is required"),
              FeedFormField(
                  controller: type,
                  labelText: "Fertilizer type",
                  valitationText: "Fertilizer type is required"),
              FeedFormField2(
                  controller: quantity,
                  labelText: "Fertilizer quantiy",
                  valitationText: "Fertilizer quantity is required"),
              FeedFormField2(
                  controller: costperunit,
                  labelText: "Cost per unit",
                  valitationText: "Cost per unit is required"),
              FeedFormField(
                  controller: applicationrate,
                  labelText: "Application rate",
                  valitationText: "Application rate is required"),
              FeedFormField(
                  controller: applicationmethod,
                  labelText: "Application method",
                  valitationText: "Application method is required"),
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
