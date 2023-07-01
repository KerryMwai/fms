import 'package:flutter/material.dart';
import 'package:fms/controller/model/fertilizer_entry.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/inventories/fertilizer/fertilizer_inventories_information.dart';
import 'package:fms/repository/inventory_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddFertilizerInventory extends StatefulWidget {
  const AddFertilizerInventory({super.key});

  @override
  State<AddFertilizerInventory> createState() => _AddFertilizerInventoryState();
}

class _AddFertilizerInventoryState extends State<AddFertilizerInventory> {
  final batchnumber = TextEditingController();
  final name = TextEditingController();
  final type = TextEditingController();
  final applicationrate = TextEditingController();
  final applicationmethod = TextEditingController();
  final planttargeted = TextEditingController();
  final quantity = TextEditingController();
  final seller = TextEditingController();
  final cost = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Add Fertilizer inventory information"),
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
                  controller: cost,
                  labelText: "Fertilizer cost",
                  valitationText: "Fertilizer cost  is required"),
              FeedFormField(
                  controller: applicationrate,
                  labelText: "Application rate",
                  valitationText: "Application rate is required"),
              FeedFormField(
                  controller: applicationmethod,
                  labelText: "Application method",
                  valitationText: "Application method is required"),
              FeedFormField(
                  controller: seller,
                  labelText: "Seller name",
                  valitationText: "Seller name is required"),
              FeedFormField(
                  controller: planttargeted,
                  labelText: "Plant targeted",
                  valitationText: "Plant targeted is required"),
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
                            InventoriesRepository().addFertlizer(
                              FertilizerEntry(name: name.text, type: type.text, quantity: int.parse(quantity.text), batchNumber: batchnumber.text, applicationRate: applicationrate.text, applicationMethod: applicationmethod.text, plantTargeted: planttargeted.text, seller: seller.text, cost: int.parse(cost.text)).toJson()
                            ).then((value) {
                              batchnumber.clear();
                              name.clear();
                              seller.clear();
                              quantity.clear();
                              type.clear();
                              cost.clear();
                              applicationmethod.clear();
                              applicationrate.clear();
                            }).then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text("Fertilizer inven added successfully")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const FertilizerInventoryInformation())));
                          }
                        },
                        child: const Text("Add Fertilizer Inventory")),
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
