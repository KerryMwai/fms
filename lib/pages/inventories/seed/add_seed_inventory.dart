import 'package:flutter/material.dart';
import 'package:fms/controller/model/seed_inventory.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/inventories/seed/seed_inventories_information.dart';
import 'package:fms/repository/inventory_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddSeedInventory extends StatefulWidget {
  const AddSeedInventory({super.key});

  @override
  State<AddSeedInventory> createState() => _AddSeedInventoryState();
}

class _AddSeedInventoryState extends State<AddSeedInventory> {
  final batchnumber = TextEditingController();
  final variety = TextEditingController();
  final source = TextEditingController();
  final quantity = TextEditingController();
  final purchasedate = TextEditingController();
  final purchasequantity = TextEditingController();
  final amountpaid = TextEditingController();
  final storage = TextEditingController();
  final planted = TextEditingController();
  final remaining = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Add Seed inventory information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: batchnumber,
                  labelText: "Seed batch number",
                  valitationText: "Seed batch number is required"),
              FeedFormField(
                  controller: variety,
                  labelText: "Seed variety",
                  valitationText: "Seed variety is required"),
              FeedFormField(
                  controller: source,
                  labelText: "Seller name",
                  valitationText: "Seller name is required"),
              FeedFormField2(
                  controller: quantity,
                  labelText: "Seed quantiy in store",
                  valitationText: "Seed quantity is required"),
              FeedFormField3(
                  controller: purchasedate,
                  labelText: "Seed purchase date",
                  valitationText: "Seed purchase date is required"),
              FeedFormField2(
                  controller: purchasequantity,
                  labelText: "Seed purchased quantity",
                  valitationText: "Seed purchased quantity is required"),
              FeedFormField2(
                  controller: amountpaid,
                  labelText: "Amount paid",
                  valitationText: "Amount paid for the seed is required"),
              FeedFormField(
                  controller: storage,
                  labelText: "Storage",
                  valitationText: "Storage is required"),
              FeedFormField2(
                  controller: planted,
                  labelText: "Seed amount planted",
                  valitationText: "seed amount planted is required"),
              FeedFormField2(
                  controller: remaining,
                  labelText: "Seed amount remaining",
                  valitationText: "seed amount remaining is required"),
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
                            InventoriesRepository()
                                .addSeedInventory(SeedInventory(
                                        batchNumber: batchnumber.text,
                                        variety: variety.text,
                                        seller: source.text,
                                        quantity: int.parse(quantity.text),
                                        purchaseQuantity:
                                            int.parse(purchasequantity.text),
                                        totalAmountPaid:
                                            double.parse(amountpaid.text),
                                        acquisitionDate: purchasedate.text,
                                        planted: int.parse(planted.text),
                                        remaining: int.parse(remaining.text),
                                        storage: storage.text)
                                    .toJson())
                                .then((value) {
                              batchnumber.clear();
                              variety.clear();
                              source.clear();
                              quantity.clear();
                              purchasedate.clear();
                              amountpaid.clear();
                              purchasequantity.clear();
                              planted.clear();
                              remaining.clear();
                              storage.clear();
                            }).then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text("Seed Inven Added")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const SeedInventoryInformation())));
                          }
                        },
                        child: const Text("Add Seed Inventory")),
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
