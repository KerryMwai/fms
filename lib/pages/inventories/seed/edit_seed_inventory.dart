import 'package:flutter/material.dart';
import 'package:fms/controller/model/seed_inventory.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/inventories/seed/seed_inventories_information.dart';
import 'package:fms/repository/inventory_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class EditSeedInventory extends StatelessWidget {
  final String id;
  final Map<String, dynamic> seedInventoryToUpdate;
  EditSeedInventory(
      {super.key, required this.id, required this.seedInventoryToUpdate});
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
    batchnumber.text = seedInventoryToUpdate['batchNumber'].toString();
    variety.text = seedInventoryToUpdate['variety'] ?? "";
    source.text = seedInventoryToUpdate['seller'] ?? "";
    quantity.text = seedInventoryToUpdate['quantity'].toString();
    purchasedate.text = seedInventoryToUpdate['acquisitionDate'] ?? "";
    purchasequantity.text =
        seedInventoryToUpdate['purchaseQuantity'].toString();
    amountpaid.text = seedInventoryToUpdate['totalAmountPaid'].toString();
    storage.text = seedInventoryToUpdate['storage'] ?? "";
    planted.text = seedInventoryToUpdate['usage']['planted'].toString();
    remaining.text = seedInventoryToUpdate['usage']['remaining'].toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Update Seed inventory information"),
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
                                .editSeedInvetory(
                                    id,
                                    SeedInventory(
                                            batchNumber: batchnumber.text,
                                            variety: variety.text,
                                            seller: source.text,
                                            quantity: int.parse(quantity.text),
                                            purchaseQuantity: int.parse(
                                                purchasequantity.text),
                                            totalAmountPaid:
                                                double.parse(amountpaid.text),
                                            acquisitionDate: purchasedate.text,
                                            planted: int.parse(planted.text),
                                            remaining:
                                                int.parse(remaining.text),
                                            storage: storage.text)
                                        .toJson())
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Seed Inven updated successful"))))
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SeedInventoryInformation())));
                          }
                          print(seedInventoryToUpdate['usage']);
                        },
                        child: const Text("Update Seed Inventory")),
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
