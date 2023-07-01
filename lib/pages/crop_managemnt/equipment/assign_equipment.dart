import 'package:flutter/material.dart';
import 'package:fms/controller/model/equipment_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/crop_managemnt/equipment/equipment_assignment_information.dart';
import 'package:fms/repository/inventory_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AssignEquipment extends StatefulWidget {
  final String id;
  final EquipmentEntry equipment;
  const AssignEquipment({super.key, required this.id, required this.equipment});

  @override
  State<AssignEquipment> createState() => _AssignEquipmentState();
}

class _AssignEquipmentState extends State<AssignEquipment> {
  bool isAssigned=false;
  final field = TextEditingController();
  final equipmentname = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    equipmentname.text=widget.equipment.name;
    field.text=widget.equipment.field;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Assign Equipment a field"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: equipmentname,
                decoration: const InputDecoration(
                  label: Text("Equipment name"),
                  border: OutlineInputBorder()
                ),
                readOnly: true,
              ),
              FeedFormField(
                  controller: field,
                  labelText: "Field name ",
                  valitationText: "Field name is required"),
              ListTile(
                leading: Checkbox(value: isAssigned, onChanged: (val){
                  setState(() {
                    isAssigned=val!;
                  });
                }),
                title: const Text("Assign the field", style: TextStyle(fontSize: 18,),),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(blueGrey),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            InventoriesRepository().editEquipment(widget.id,EquipmentEntry(serialNumber: widget.equipment.serialNumber, name: widget.equipment.name, type: widget.equipment.type, description: widget.equipment.description, manufacturer: widget.equipment.manufacturer, model: widget.equipment.model, yearOfManufacture: widget.equipment.yearOfManufacture, purchasePrice: widget.equipment.purchasePrice, purchaseDate:widget.equipment.purchaseDate, maintenanceSchedule: widget.equipment.maintenanceSchedule,assigned: isAssigned,field: field.text).toJson()).then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar( SnackBar(
                                        content: Text("Equipment assigned to ${field.text}  successfully")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const EquipmentAssignmentInformation())));
                          }
                        },
                        child: const Text("Assign Equipment")),
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
