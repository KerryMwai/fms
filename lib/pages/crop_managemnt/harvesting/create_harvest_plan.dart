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
  final date=TextEditingController();
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
               FeedFormField3(controller: date,labelText: "Harvesting date",valitationText: "Hervesting date is required"),
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