import 'package:flutter/material.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class CreateHarvestPlan extends StatefulWidget {
  const CreateHarvestPlan({super.key});

  @override
  State<CreateHarvestPlan> createState() => _CreateHarvestPlanState();
}

class _CreateHarvestPlanState extends State<CreateHarvestPlan> {
  final crop=TextEditingController();
  final method=TextEditingController();
  final season=TextEditingController();
  final quantity=TextEditingController();
  final equipment=TextEditingController();
  final labor=TextEditingController();
  final storage=TextEditingController();
  DateTime? harvestingdate;
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Create Harvest Plan"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Form(
        key: _formKey,
        child: ListView(
          children: [
             FeedFormField(controller: crop,labelText: "Type of crop ",valitationText: "Crop name is required"),
              FeedFormField(controller: method,labelText: "Harvesting method",valitationText: "Harvesting method is required"),
              FeedFormField(controller: season,labelText: "Harvesting season",valitationText: "Hervesting season is required"),
              FeedFormField2(controller: quantity,labelText: "Estimate quantity",valitationText: "Estimate quantity is required"),
               FeedFormField(controller: equipment,labelText: "Harvesting equipment",valitationText: "Harvesting equipment is required"),
               FeedFormField2(controller: labor,labelText: "Harvesting labor (number of workers)",valitationText: "Hervesting labor is required"),
               FeedFormField(controller: storage,labelText: "Harvest storage",valitationText: "Hervest storage is required"),
               Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: TextFormField(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2040),
                    );
                    setState(() {
                      harvestingdate = picked!;
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Harvesting date',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (harvestingdate == null) {
                      return 'Please select a harvesting date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: harvestingdate != null
                        ? harvestingdate.toString().split(' ')[0]
                        : '',
                  ),
                             ),
               ),
              const SizedBox(height: 30,),
              const SizedBox(height: 30,),
           Expanded(child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.4,
                child: ElevatedButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(blueGrey),
                    padding:const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30))
                  ),
                  onPressed: (){
                  if(_formKey.currentState!.validate()){
                      
                  }
                }, child:const Text("Create Plan")),)
              ],
             ))
          ],
        ),
      ),),
    );
  }
}