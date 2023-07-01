import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class PurchaseSeeds extends StatefulWidget {
  const PurchaseSeeds({super.key});

  @override
  State<PurchaseSeeds> createState() => _PurchaseSeedsState();
}

class _PurchaseSeedsState extends State<PurchaseSeeds> {
  final subject = TextEditingController();
  final variety = TextEditingController();
  final type = TextEditingController();
  final purchasequantity = TextEditingController();
  final amountpaid = TextEditingController();
  final youremail = TextEditingController();
  final selleremail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Purchase seeds"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: subject,
                  labelText: "Subject of purchase",
                  valitationText: "Subject of purchase is required"),
              FeedFormField(
                  controller: variety,
                  labelText: "Seed variety",
                  valitationText: "Seed variety is required"),
              FeedFormField(
                  controller: type,
                  labelText: "Seed type",
                  valitationText: "Seed type is required"),
              FeedFormField2(
                  controller: purchasequantity,
                  labelText: "Seed purchased quantity",
                  valitationText: "Seed purchased quantity is required"),
              FeedFormField2(
                  controller: amountpaid,
                  labelText: "Seed purchase price",
                  valitationText: "Seed purchased price is required"),
              FeedFormField(
                  controller: selleremail,
                  labelText: "Seller email",
                  valitationText: "Seller email is required"),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(blueGrey),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final Email email = Email(
                              body: """Variety: ${variety.text}\nSeed type: ${type.text}\nSeed quantity: ${purchasequantity.text} Kgs\nTotal Amount: Ksh. ${amountpaid.text}
                                  """,
                              subject: subject.text,
                              recipients: [selleremail.text],
                              isHTML: false,
                            );
                            String platformResponse;

                            try {
                              // InventoriesRepository().storepurchsesendEmail(selleremail.text, subject.text, 
                              // """
                              //       Variety: ${variety.text}
                              //       Seed type: ${type.text}
                              //       Seed quantity: ${purchasequantity.text} Kgs
                              //       Total Amount: Ksh. ${amountpaid.text}
                              //     """);
                              await FlutterEmailSender.send(email);
                              platformResponse = 'success';
                            } catch (error) {
                              print(error);
                              platformResponse = error.toString();
                            }

                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(platformResponse),
                              ),
                            );
                          }
                        },
                        child: const Text("Send purchase order")),
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
